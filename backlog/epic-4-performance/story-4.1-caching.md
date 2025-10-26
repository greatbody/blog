# Story 4.1: Rails Caching Strategy

**Epic:** EPIC-4: Performance Optimization  
**Priority:** P1 (Should Have)  
**Story Points:** 8

## User Story
**As a** blog owner  
**I want** aggressive caching of rendered content  
**So that** page load times are under 1 second

## Acceptance Criteria
- [ ] Production cache enabled (`config.action_controller.perform_caching = true`)
- [ ] File store configured as cache backend
- [ ] Fragment caching for rendered Markdown posts
- [ ] Cache automatically expires on post update
- [ ] HTTP caching with ETag headers for post pages
- [ ] Cache-Control headers for static assets (1 year)
- [ ] Performance targets met: Homepage <500ms, Post page <300ms

## Technical Notes
- Use `cache post do` blocks in views
- Leverage ActiveRecord touch for auto-expiration
- Document cache clearing: `rails cache:clear`

## Definition of Done
- [ ] All acceptance criteria met
- [ ] Performance benchmarked with ApacheBench
- [ ] Integration tests verify caching behavior
- [ ] Documentation for cache management

## Dependencies
- [Story 2.4: Syntax Highlighting](../epic-2-content-management/story-2.4-syntax-highlighting.md)
