# Story 3.3: Client-Side Event Tracking

**Epic:** EPIC-3: Self-Hosted Analytics  
**Priority:** P2 (Nice to Have)  
**Story Points:** 8

## User Story

**As a** blog owner  
**I want** to track user interactions (clicks, scroll depth, reading time)  
**So that** I can understand engagement beyond page views

## Acceptance Criteria

### 1. JavaScript Tracker
- [ ] Vanilla JS file: `app/javascript/analytics.js`
- [ ] Included in application layout
- [ ] Minified and lightweight (<5KB)
- [ ] No external dependencies

### 2. Events Tracked
- [ ] **Scroll Depth**: Fire event at 25%, 50%, 75%, 100% scroll
- [ ] **Link Clicks**: Track all external link clicks (href starting with http)
- [ ] **Reading Time**: Track time spent on post pages (send on unload)
- [ ] **Search**: Track search queries (if search feature implemented)

### 3. Event Endpoint
- [ ] POST `/analytics/events` endpoint
- [ ] Controller: `AnalyticsController#create_event`
- [ ] Accepts JSON: `{ event_type, target, metadata }`
- [ ] Creates Event record asynchronously
- [ ] Returns 204 No Content
- [ ] No authentication required (uses session)

### 4. Scroll Depth Tracking
- [ ] Calculate scroll percentage: `(scrollY + windowHeight) / documentHeight`
- [ ] Fire once per threshold (don't spam events)
- [ ] Send event with `event_type: "scroll"`, `target: "75%"`

### 5. Link Click Tracking
- [ ] Add click listener to `<a>` tags
- [ ] Only track external links
- [ ] Send event with `event_type: "click"`, `target: href`
- [ ] Don't prevent default behavior

### 6. Reading Time Tracking
- [ ] Start timer on page load
- [ ] Send event on `beforeunload` or `visibilitychange` (page hidden)
- [ ] Send event with `event_type: "read_complete"`, `target: page path`, `metadata: { duration_seconds: X }`

### 7. Privacy and Performance
- [ ] Respect DNT header (check on server side)
- [ ] Debounce/throttle events (max 1 request per second)
- [ ] Use `navigator.sendBeacon` for reliable unload tracking
- [ ] Fail silently if endpoint unreachable

## Technical Implementation

**JavaScript:**
```javascript
// app/javascript/analytics.js
(function() {
  if (navigator.doNotTrack === '1') return;

  const sessionId = document.querySelector('meta[name="session-id"]')?.content;
  const scrollThresholds = [25, 50, 75, 100];
  const firedScrollEvents = new Set();
  let pageStartTime = Date.now();

  function sendEvent(eventType, target, metadata = {}) {
    const payload = JSON.stringify({
      event_type: eventType,
      target: target,
      metadata: JSON.stringify(metadata),
      session_id: sessionId
    });

    if (navigator.sendBeacon) {
      navigator.sendBeacon('/analytics/events', payload);
    } else {
      fetch('/analytics/events', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: payload,
        keepalive: true
      }).catch(() => {});
    }
  }

  // Scroll depth tracking
  function checkScrollDepth() {
    const scrollPercent = Math.floor(
      ((window.scrollY + window.innerHeight) / document.documentElement.scrollHeight) * 100
    );

    scrollThresholds.forEach(threshold => {
      if (scrollPercent >= threshold && !firedScrollEvents.has(threshold)) {
        sendEvent('scroll', `${threshold}%`);
        firedScrollEvents.add(threshold);
      }
    });
  }

  let scrollTimer;
  window.addEventListener('scroll', () => {
    clearTimeout(scrollTimer);
    scrollTimer = setTimeout(checkScrollDepth, 300);
  });

  // External link tracking
  document.addEventListener('click', (e) => {
    const link = e.target.closest('a');
    if (link && link.href && (link.href.startsWith('http://') || link.href.startsWith('https://'))) {
      const isExternal = !link.href.startsWith(window.location.origin);
      if (isExternal) {
        sendEvent('click', link.href);
      }
    }
  });

  // Reading time tracking
  function trackReadingTime() {
    const durationSeconds = Math.floor((Date.now() - pageStartTime) / 1000);
    if (durationSeconds > 5) { // Only track if user spent >5 seconds
      sendEvent('read_complete', window.location.pathname, { duration_seconds: durationSeconds });
    }
  }

  window.addEventListener('beforeunload', trackReadingTime);
  document.addEventListener('visibilitychange', () => {
    if (document.hidden) trackReadingTime();
  });
})();
```

**Controller:**
```ruby
# app/controllers/analytics_controller.rb
class AnalyticsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  skip_after_action :track_page_view

  def create_event
    return head :no_content if request.headers['DNT'] == '1'

    TrackEventJob.perform_later(
      event_type: params[:event_type],
      target: params[:target],
      metadata: params[:metadata],
      session_id: params[:session_id]
    )

    head :no_content
  end
end
```

**Job:**
```ruby
# app/jobs/track_event_job.rb
class TrackEventJob < ApplicationJob
  queue_as :default

  def perform(event_type:, target:, metadata:, session_id:)
    Event.create!(
      event_type: event_type,
      target: target,
      metadata: metadata,
      session_id: session_id
    )
  rescue => e
    Rails.logger.error("Failed to track event: #{e.message}")
  end
end
```

**Routes:**
```ruby
post '/analytics/events', to: 'analytics#create_event'
```

## Definition of Done

- [ ] All acceptance criteria met
- [ ] JS tested in Chrome, Firefox, Safari
- [ ] Controller tests for event endpoint
- [ ] Integration tests verify events recorded
- [ ] Performance tested (no impact on page load)
- [ ] DNT respected

## Dependencies

- [Story 3.1: Analytics Data Models](./story-3.1-analytics-models.md)

## Related Stories

- [Story 3.4: Analytics Dashboard](./story-3.4-analytics-dashboard.md)
