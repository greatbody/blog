# Story 4.3: Database Query Optimization

**Epic:** EPIC-4: Performance Optimization  
**Priority:** P1 (Should Have)  
**Story Points:** 5

## User Story
**As a** developer  
**I want** optimized database queries  
**So that** page rendering is fast even with many posts

## Acceptance Criteria
- [ ] Index on `posts.slug`
- [ ] Index on `posts.published_at`
- [ ] Index on `page_views.path` and `created_at`
- [ ] Index on `sessions.session_id`
- [ ] No N+1 queries (verified with Bullet gem)
- [ ] Homepage query <20ms (20 posts)
- [ ] Individual post query <10ms
- [ ] Analytics queries <500ms total

## Technical Notes
- Install Bullet gem in development for N+1 detection
- Use `explain` for complex queries
- Log slow queries (>100ms)

## Definition of Done
- [ ] All acceptance criteria met
- [ ] Indexes verified in schema.rb
- [ ] Bullet configured and passing
- [ ] Performance benchmarked with 100+ posts

## Dependencies
- [Story 2.1: Post Model](../epic-2-content-management/story-2.1-post-model.md)
- [Story 3.1: Analytics Models](../epic-3-analytics/story-3.1-analytics-models.md)
