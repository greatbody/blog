# Story 5.2: Database Configuration

**Epic:** EPIC-5: Infrastructure & Deployment
**Priority:** P0 (Must Have)
**Story Points:** 2

## User Story
**As a** developer
**I want** SQLite configured properly
**So that** data is persisted reliably

## Acceptance Criteria
- [x] SQLite3 configured for development, test, and production
- [x] Database files: development.sqlite3, test.sqlite3, production.sqlite3
- [x] config/database.yml properly configured
- [x] All migrations in db/migrate/ directory
- [x] Schema.rb kept up to date
- [x] db/seeds.rb creates sample data (5 posts, 1 user)
- [x] Backup process documented

## Definition of Done
- [ ] All acceptance criteria met
- [x] `rails db:migrate` runs successfully
- [x] `rails db:seed` creates sample data
- [x] Sample data verified
- [x] Backup documentation in README

## Dependencies
- [Story 5.1: Project Setup](./story-5.1-project-setup.md)
