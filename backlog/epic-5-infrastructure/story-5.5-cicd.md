# Story 5.5: CI/CD Pipeline

**Epic:** EPIC-5: Infrastructure & Deployment  
**Priority:** P2 (Nice to Have)  
**Story Points:** 5

## User Story
**As a** developer  
**I want** automated testing and deployment  
**So that** changes are validated before going live

## Acceptance Criteria
- [ ] GitHub Actions workflow configured (.github/workflows/ci.yml)
- [ ] CI triggers on push to main and pull requests
- [ ] CI pipeline steps:
  - Install Ruby and dependencies
  - Setup test database
  - Run migrations
  - Run all tests
  - Run linter (optional)
- [ ] Pipeline fails if tests fail
- [ ] CD pipeline deploys to production on main branch (after CI passes)
- [ ] CD runs migrations in production
- [ ] GitHub status checks on PRs
- [ ] Notifications on failure

## Definition of Done
- [ ] All acceptance criteria met
- [ ] CI pipeline passing
- [ ] CD successfully deploys to production
- [ ] Documentation in README

## Dependencies
- [Story 5.4: Production Deployment](./story-5.4-deployment.md)
