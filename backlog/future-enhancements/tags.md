# Enhancement: Post Categories/Tags

**Priority:** P3 (Future)  
**Story Points:** 8

## User Story
**As a** blog owner  
**I want** to categorize posts with tags  
**So that** readers can browse by topic

## Acceptance Criteria
- [ ] Tag model with many-to-many relationship to posts
- [ ] Tag input in post form (comma-separated)
- [ ] Tag pages listing all posts with that tag
- [ ] Tag cloud on homepage (optional)
- [ ] Slug-based tag URLs

## Technical Notes
- Use join table: post_tags (post_id, tag_id)
- Keep it simple—no tag hierarchies
