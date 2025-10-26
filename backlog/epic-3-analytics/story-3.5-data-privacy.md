# Story 3.5: Data Retention and Privacy

**Epic:** EPIC-3: Self-Hosted Analytics  
**Priority:** P1 (Should Have)  
**Story Points:** 5

## User Story

**As a** blog owner  
**I want** automated data cleanup and privacy compliance  
**So that** I respect user privacy and manage storage

## Acceptance Criteria

### 1. Data Retention Policy
- [ ] Raw PageView and Event records older than 90 days are purged
- [ ] Session records older than 90 days are purged
- [ ] Aggregated AnalyticsSummary records retained indefinitely

### 2. Cleanup Job
- [ ] Background job: `CleanupOldAnalyticsJob`
- [ ] Scheduled to run nightly (use whenever gem or cron)
- [ ] Deletes PageView records where `created_at < 90.days.ago`
- [ ] Deletes Event records where `created_at < 90.days.ago`
- [ ] Deletes Session records where `last_seen < 90.days.ago`
- [ ] Logs count of deleted records

### 3. DNT Enforcement
- [ ] All tracking code checks `request.headers['DNT']`
- [ ] If DNT == "1", no PageView, Session, or Event records created
- [ ] Analytics endpoints return early if DNT enabled

### 4. IP Privacy
- [ ] No raw IPs stored anywhere in database
- [ ] Only SHA256 hashes stored in `ip_hash` column
- [ ] Hashing cannot be reversed

### 5. User Data Access
- [ ] No PII (personally identifiable information) collected
- [ ] No email, name, or user ID tracked (beyond session ID)
- [ ] Session IDs are randomized Rails session IDs (not user-identifiable)

### 6. Opt-Out Mechanism
- [ ] Check DNT header automatically
- [ ] Optional: Add `/opt-out` page with instructions to enable DNT in browser

## Technical Implementation

**Cleanup Job:**
```ruby
# app/jobs/cleanup_old_analytics_job.rb
class CleanupOldAnalyticsJob < ApplicationJob
  queue_as :default

  def perform
    cutoff_date = 90.days.ago

    page_views_deleted = PageView.where('created_at < ?', cutoff_date).delete_all
    events_deleted = Event.where('created_at < ?', cutoff_date).delete_all
    sessions_deleted = Session.where('last_seen < ?', cutoff_date).delete_all

    Rails.logger.info("Analytics cleanup: Deleted #{page_views_deleted} page views, #{events_deleted} events, #{sessions_deleted} sessions")
  end
end
```

**Schedule (using whenever gem):**
```ruby
# config/schedule.rb
every 1.day, at: '2:00 am' do
  runner "CleanupOldAnalyticsJob.perform_later"
end
```

**Or manual cron:**
```bash
# crontab -e
0 2 * * * cd /path/to/app && bin/rails runner "CleanupOldAnalyticsJob.perform_now"
```

**DNT Check Helper:**
```ruby
# app/controllers/application_controller.rb
def do_not_track?
  request.headers['DNT'] == '1'
end

def track_page_view
  return if do_not_track?
  # ... rest of tracking code
end
```

**Opt-Out Page (optional):**
```erb
<!-- app/views/pages/opt_out.html.erb -->
<h1>Privacy & Opt-Out</h1>

<p>
  This blog uses self-hosted analytics to understand which content is most valuable.
  We respect your privacy:
</p>

<ul>
  <li>No IP addresses are stored (only hashed)</li>
  <li>No personally identifiable information collected</li>
  <li>No third-party analytics services</li>
  <li>Data automatically deleted after 90 days</li>
</ul>

<h2>Opt-Out</h2>
<p>
  To opt out of tracking, enable "Do Not Track" (DNT) in your browser:
</p>
<ul>
  <li><strong>Chrome/Edge:</strong> Settings → Privacy and security → Send a "Do Not Track" request</li>
  <li><strong>Firefox:</strong> Settings → Privacy & Security → Send websites a "Do Not Track" signal</li>
  <li><strong>Safari:</strong> Preferences → Privacy → Website tracking: Prevent cross-site tracking</li>
</ul>

<p>
  <strong>Current DNT status:</strong>
  <% if request.headers['DNT'] == '1' %>
    ✓ Enabled - You are not being tracked
  <% else %>
    ✗ Disabled - Tracking is active
  <% end %>
</p>
```

## Definition of Done

- [ ] All acceptance criteria met
- [ ] Cleanup job tested (verify old records deleted)
- [ ] DNT enforcement tested (no tracking with DNT=1)
- [ ] IP hashing verified (no raw IPs in DB)
- [ ] Privacy policy documented in README
- [ ] Opt-out page created (optional)

## Dependencies

- [Story 3.2: Page View Tracking](./story-3.2-pageview-tracking.md)
- [Story 3.3: Client-Side Event Tracking](./story-3.3-event-tracking.md)

## Related Stories

- [Story 3.2: Page View Tracking](./story-3.2-pageview-tracking.md)
