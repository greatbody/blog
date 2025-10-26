# Story 3.2: Page View Tracking

**Epic:** EPIC-3: Self-Hosted Analytics  
**Priority:** P1 (Should Have)  
**Story Points:** 8

## User Story

**As a** blog owner  
**I want** automatic page view tracking  
**So that** I can see which posts are most popular

## Acceptance Criteria

### 1. Tracking Filter
- [ ] `ApplicationController` has `after_action :track_page_view`
- [ ] Tracks all GET requests (not POST/PUT/DELETE)
- [ ] Skips tracking for admin/analytics routes (e.g., `/admin/analytics`)
- [ ] Runs asynchronously (doesn't block response)

### 2. IP Hashing
- [ ] Extract IP from `request.remote_ip`
- [ ] Hash with SHA256: `Digest::SHA256.hexdigest(ip)`
- [ ] Store only hash in `ip_hash` field
- [ ] Never store raw IP address

### 3. User Agent Parsing
- [ ] Use `browser` gem to parse user agent
- [ ] Extract: device type, browser name/version, OS name/version
- [ ] Create or update Session record with parsed data

### 4. Session Tracking
- [ ] Use Rails `session.id` as `session_id`
- [ ] Create Session record on first page view
- [ ] Update `last_seen` on subsequent views
- [ ] Track country via IP lookup (optional, use `geoip` gem or skip)

### 5. Data Captured
- [ ] Path from `request.path`
- [ ] Referrer from `request.referrer` (nullable)
- [ ] User agent from `request.user_agent`
- [ ] Response time calculated from request start to finish

### 6. Async Processing
- [ ] Use ActiveJob with inline adapter (simple, no Redis needed)
- [ ] Background job: `TrackPageViewJob`
- [ ] Job creates PageView and Session records
- [ ] Errors logged but don't crash app

### 7. DNT (Do Not Track) Support
- [ ] Check `request.headers['DNT']`
- [ ] If DNT == "1", skip all tracking
- [ ] Respect user privacy preferences

## Technical Implementation

**Controller:**
```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  after_action :track_page_view, if: -> { request.get? && !skip_tracking? }

  private

  def track_page_view
    return if request.headers['DNT'] == '1'
    
    TrackPageViewJob.perform_later(
      path: request.path,
      referrer: request.referrer,
      user_agent: request.user_agent,
      ip: request.remote_ip,
      session_id: session.id.to_s,
      response_time_ms: (Time.current - request.start_time) * 1000
    )
  end

  def skip_tracking?
    request.path.start_with?('/admin', '/analytics')
  end
end
```

**Job:**
```ruby
# app/jobs/track_page_view_job.rb
class TrackPageViewJob < ApplicationJob
  queue_as :default

  def perform(path:, referrer:, user_agent:, ip:, session_id:, response_time_ms:)
    ip_hash = Digest::SHA256.hexdigest(ip)
    
    PageView.create!(
      path: path,
      referrer: referrer,
      user_agent: user_agent,
      ip_hash: ip_hash,
      session_id: session_id,
      response_time_ms: response_time_ms.to_i
    )

    update_session(session_id, user_agent)
  rescue => e
    Rails.logger.error("Failed to track page view: #{e.message}")
  end

  private

  def update_session(session_id, user_agent)
    browser = Browser.new(user_agent)
    
    session_record = Session.find_or_initialize_by(session_id: session_id)
    session_record.device_type = browser.device.mobile? ? 'mobile' : (browser.device.tablet? ? 'tablet' : 'desktop')
    session_record.browser = "#{browser.name} #{browser.version}"
    session_record.os = "#{browser.platform.name} #{browser.platform.version}"
    session_record.first_seen ||= Time.current
    session_record.last_seen = Time.current
    session_record.save!
  end
end
```

## Definition of Done

- [ ] All acceptance criteria met
- [ ] Job tests verify PageView and Session creation
- [ ] Integration tests verify tracking on page load
- [ ] DNT header respected (test with DNT=1)
- [ ] Performance tested (no visible delay)

## Dependencies

- [Story 3.1: Analytics Data Models](./story-3.1-analytics-models.md)
- Browser gem installed: `gem 'browser'`

## Related Stories

- [Story 3.4: Analytics Dashboard](./story-3.4-analytics-dashboard.md)
- [Story 3.5: Data Retention and Privacy](./story-3.5-data-privacy.md)
