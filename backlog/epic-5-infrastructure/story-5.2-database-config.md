# Story 5.2: Database Configuration

**Epic:** EPIC-5: Infrastructure & Deployment  
**Priority:** P0 (Must Have)  
**Story Points:** 2

## User Story
**As a** developer  
**I want** SQLite configured properly  
**So that** data is persisted reliably

## Acceptance Criteria
- [ ] SQLite3 configured for development, test, and production
- [ ] Database files: development.sqlite3, test.sqlite3, production.sqlite3
- [ ] config/database.yml properly configured
- [ ] All migrations in db/migrate/ directory
- [ ] Schema.rb kept up to date
- [ ] db/seeds.rb creates sample data (5 posts, 1 user)
- [ ] Backup process documented

## Definition of Done
- [ ] All acceptance criteria met
- [ ] `rails db:migrate` runs successfully
- [ ] `rails db:seed` creates sample data
- [ ] Sample data verified
- [ ] Backup documentation in README

## Dependencies
- [Story 5.1: Project Setup](./story-5.1-project-setup.md)
