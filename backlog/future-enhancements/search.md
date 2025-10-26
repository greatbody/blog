# Enhancement: Full-Text Search

**Priority:** P3 (Future)  
**Story Points:** 8

## User Story
**As a** blog reader  
**I want** to search posts by keyword  
**So that** I can find relevant content quickly

## Acceptance Criteria
- [ ] Search endpoint `/search?q=query`
- [ ] Search across post titles and content
- [ ] Use PostgreSQL full-text search or SQLite FTS5
- [ ] Display results ranked by relevance
- [ ] Highlight search terms in results
- [ ] Pagination for search results

## Technical Notes
- Consider PostgreSQL migration if search is critical
- Or use SQLite FTS5 virtual tables
- Index title and content columns
