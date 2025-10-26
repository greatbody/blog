# Story 4.4: Performance Monitoring

**Epic:** EPIC-4: Performance Optimization  
**Priority:** P2 (Nice to Have)  
**Story Points:** 5

## User Story
**As a** blog owner  
**I want** performance metrics tracked  
**So that** I can identify and fix slow pages

## Acceptance Criteria
- [ ] Response time captured in PageView.response_time_ms
- [ ] Performance section in analytics dashboard showing:
  - Average response time (last 7 days)
  - 95th percentile response time
  - Slowest pages (top 10 by avg response time)
- [ ] Slow request logging (>500ms) with path and timestamp
- [ ] rack-mini-profiler installed in development

## Technical Notes
- Leverage existing PageView tracking from Story 3.2
- Add metrics to analytics dashboard from Story 3.4
- Development-only profiling tools

## Definition of Done
- [ ] All acceptance criteria met
- [ ] Performance metrics visible in dashboard
- [ ] Slow request logging tested
- [ ] rack-mini-profiler working in dev

## Dependencies
- [Story 3.2: Page View Tracking](../epic-3-analytics/story-3.2-pageview-tracking.md)
- [Story 3.4: Analytics Dashboard](../epic-3-analytics/story-3.4-analytics-dashboard.md)
