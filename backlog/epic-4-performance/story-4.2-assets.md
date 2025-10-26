# Story 4.2: Asset Optimization

**Epic:** EPIC-4: Performance Optimization  
**Priority:** P1 (Should Have)  
**Story Points:** 5

## User Story
**As a** blog visitor  
**I want** fast asset loading  
**So that** pages render quickly

## Acceptance Criteria
- [ ] Asset pipeline configured with minification
- [ ] Single application.css file (<20KB uncompressed)
- [ ] Minimal JS (<15KB total uncompressed)
- [ ] No images used (text-only, SVG icons if necessary)
- [ ] System font stack (no web fonts)
- [ ] Gzip compression enabled
- [ ] Long cache headers for static assets
- [ ] Lighthouse score 90+ (desktop), 85+ (mobile)

## Technical Notes
- Use plain CSS (no frameworks)
- Font stack: `-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif`
- Asset fingerprinting for cache busting

## Definition of Done
- [ ] All acceptance criteria met
- [ ] Lighthouse audit passed
- [ ] WebPageTest shows <1s load time
- [ ] Asset sizes documented

## Dependencies
- [Story 5.1: Project Setup](../epic-5-infrastructure/story-5.1-project-setup.md)
