# Personal Blog - Product Backlog

## Overview
A secure, performant personal blog for technical articles built with Ruby on Rails, protected by GitHub OAuth SSO, featuring syntax highlighting for 100+ programming languages, self-hosted analytics, and optimized for fast loading with minimal image usage.

---

## Epics

### [EPIC-1: Authentication & Security](./epic-1-authentication/README.md)
GitHub OAuth-based Single Sign-On to protect blog access

**Stories:** 2 | **Story Points:** 11

- [Story 1.1: GitHub OAuth Integration](./epic-1-authentication/story-1.1-github-oauth.md) (8 pts)
- [Story 1.2: Session Management](./epic-1-authentication/story-1.2-session-management.md) (3 pts)

---

### [EPIC-2: Content Management](./epic-2-content-management/README.md)
Blog post creation, editing, and display with Markdown and syntax highlighting

**Stories:** 7 | **Story Points:** 40

- [Story 2.1: Post Model & Database Schema](./epic-2-content-management/story-2.1-post-model.md) (3 pts)
- [Story 2.2: Post CRUD Operations](./epic-2-content-management/story-2.2-post-crud.md) (8 pts)
- [Story 2.3: Markdown Rendering](./epic-2-content-management/story-2.3-markdown-rendering.md) (5 pts)
- [Story 2.4: Syntax Highlighting](./epic-2-content-management/story-2.4-syntax-highlighting.md) (8 pts)
- [Story 2.5: Post Editor with Live Preview](./epic-2-content-management/story-2.5-live-preview.md) (8 pts)
- [Story 2.6: Public Homepage](./epic-2-content-management/story-2.6-public-homepage.md) (5 pts)
- [Story 2.7: RSS Feed](./epic-2-content-management/story-2.7-rss-feed.md) (3 pts)

---

### [EPIC-3: Self-Hosted Analytics](./epic-3-analytics/README.md)
Complete analytics system tracking page views, user behavior, and performance metrics

**Stories:** 5 | **Story Points:** 39

- [Story 3.1: Analytics Data Models](./epic-3-analytics/story-3.1-analytics-models.md) (5 pts)
- [Story 3.2: Page View Tracking](./epic-3-analytics/story-3.2-pageview-tracking.md) (8 pts)
- [Story 3.3: Client-Side Event Tracking](./epic-3-analytics/story-3.3-event-tracking.md) (8 pts)
- [Story 3.4: Analytics Dashboard](./epic-3-analytics/story-3.4-analytics-dashboard.md) (13 pts)
- [Story 3.5: Data Retention and Privacy](./epic-3-analytics/story-3.5-data-privacy.md) (5 pts)

---

### [EPIC-4: Performance Optimization](./epic-4-performance/README.md)
Fast page loads (<1s), caching, minimal assets

**Stories:** 4 | **Story Points:** 23

- [Story 4.1: Rails Caching Strategy](./epic-4-performance/story-4.1-caching.md) (8 pts)
- [Story 4.2: Asset Optimization](./epic-4-performance/story-4.2-assets.md) (5 pts)
- [Story 4.3: Database Query Optimization](./epic-4-performance/story-4.3-queries.md) (5 pts)
- [Story 4.4: Performance Monitoring](./epic-4-performance/story-4.4-monitoring.md) (5 pts)

---

### [EPIC-5: Infrastructure & Deployment](./epic-5-infrastructure/README.md)
Project setup, database configuration, hosting, and CI/CD

**Stories:** 5 | **Story Points:** 21

- [Story 5.1: Project Setup](./epic-5-infrastructure/story-5.1-project-setup.md) (3 pts)
- [Story 5.2: Database Configuration](./epic-5-infrastructure/story-5.2-database-config.md) (2 pts)
- [Story 5.3: Development Environment](./epic-5-infrastructure/story-5.3-dev-environment.md) (3 pts)
- [Story 5.4: Production Deployment](./epic-5-infrastructure/story-5.4-deployment.md) (8 pts)
- [Story 5.5: CI/CD Pipeline](./epic-5-infrastructure/story-5.5-cicd.md) (5 pts)

---

### [Future Enhancements](./future-enhancements/README.md)
Post-MVP features and improvements

**Stories:** 5 | **Story Points:** 36

- [Full-Text Search](./future-enhancements/search.md) (8 pts)
- [Post Categories/Tags](./future-enhancements/tags.md) (8 pts)
- [Comment System](./future-enhancements/comments.md) (13 pts)
- [Dark Mode](./future-enhancements/dark-mode.md) (5 pts)
- [Reading Time Estimate](./future-enhancements/reading-time.md) (2 pts)

---

## Summary

**Total Story Points:** 134 (MVP) + 36 (Future)

### By Priority:
- **P0 (Must Have):** 44 points
- **P1 (Should Have):** 61 points
- **P2 (Nice to Have):** 29 points
- **P3 (Future):** 36 points

---

## Sprint Planning

### Sprint 1 (MVP Foundation) - 19 points
- Story 5.1: Project Setup (3)
- Story 5.2: Database Configuration (2)
- Story 5.3: Development Environment (3)
- Story 1.1: GitHub OAuth Integration (8)
- Story 1.2: Session Management (3)

### Sprint 2 (Core Blog Features) - 21 points
- Story 2.1: Post Model & Database Schema (3)
- Story 2.2: Post CRUD Operations (8)
- Story 2.3: Markdown Rendering (5)
- Story 2.6: Public Homepage (5)

### Sprint 3 (Content & Performance) - 26 points
- Story 2.4: Syntax Highlighting (8)
- Story 4.1: Rails Caching Strategy (8)
- Story 4.2: Asset Optimization (5)
- Story 4.3: Database Query Optimization (5)

### Sprint 4 (Analytics Foundation) - 26 points
- Story 3.1: Analytics Data Models (5)
- Story 3.2: Page View Tracking (8)
- Story 3.4: Analytics Dashboard (13)

### Sprint 5 (Analytics & Deployment) - 21 points
- Story 3.3: Client-Side Event Tracking (8)
- Story 3.5: Data Retention and Privacy (5)
- Story 5.4: Production Deployment (8)

### Sprint 6 (Polish & Enhancements) - 21 points
- Story 2.5: Post Editor with Live Preview (8)
- Story 2.7: RSS Feed (3)
- Story 4.4: Performance Monitoring (5)
- Story 5.5: CI/CD Pipeline (5)

---

## Definitions

### Definition of Ready (DoR)
A story is ready for development when:
1. Acceptance criteria are clear and testable
2. Dependencies identified and resolved
3. Technical approach discussed
4. Story points estimated by team
5. No blocking questions remain

### Definition of Done (DoD)
A story is done when:
1. All acceptance criteria met
2. Code reviewed and approved
3. Unit tests written and passing
4. Integration tests written and passing (where applicable)
5. Manual testing completed
6. Documentation updated (README, inline comments)
7. No high-severity bugs
8. Deployed to staging (if applicable) and verified
9. Product owner accepts the story

---

## Principles

- **Simplicity First:** Every story prioritizes simple, readable solutions over clever abstractions
- **Rails Conventions:** Leverage Rails defaults and conventions to reduce decisions
- **No Over-Engineering:** Skip features that don't serve the core blogging problem
- **Practicality:** Choose boring, reliable approaches over exciting but unproven ones
- **10-Year Test:** Every design decision should make sense a decade from now
- **No Images:** Text-only UI to optimize performance
- **Self-Hosted Analytics:** Complete isolation from third-party services for privacy and control
