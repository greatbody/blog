# Story 2.1: Post Model & Database Schema

**Epic:** EPIC-2: Content Management  
**Priority:** P0 (Must Have)  
**Story Points:** 3

## User Story

**As a** developer  
**I want** a Post model with proper schema  
**So that** blog posts can be stored and retrieved efficiently

## Acceptance Criteria

### 1. Post Model Fields
- [ ] `title`: string, required, max 255 characters
- [ ] `content`: text, required (stores Markdown)
- [ ] `slug`: string, unique, indexed, auto-generated from title
- [ ] `published`: boolean, default false
- [ ] `published_at`: datetime, nullable
- [ ] `created_at`, `updated_at`: timestamps

### 2. Validations
- [ ] Title presence validated
- [ ] Title length <= 255 characters
- [ ] Content presence validated
- [ ] Slug uniqueness validated
- [ ] Slug automatically generated from title using parameterize

### 3. Model Methods
- [ ] `published` scope returns only published posts
- [ ] `draft` scope returns unpublished posts
- [ ] `publish!` method sets published=true and published_at=now
- [ ] `unpublish!` method sets published=false

### 4. Database
- [ ] SQLite database configured in development and production
- [ ] Migration creates posts table with all fields
- [ ] Index on slug column
- [ ] Index on published_at column
- [ ] No foreign key constraints (application-level integrity only)

## Technical Notes

- Use Rails' `parameterize` for slug generation
- Handle duplicate slug edge cases by appending counter
- Example: "My Post" → "my-post", "My Post" (duplicate) → "my-post-2"

## Definition of Done

- [ ] All acceptance criteria met
- [ ] Model unit tests (validations, scopes, methods)
- [ ] Migration runs successfully
- [ ] Schema documented

## Dependencies

- [Story 5.2: Database Configuration](../epic-5-infrastructure/story-5.2-database-config.md)

## Related Stories

- [Story 2.2: Post CRUD Operations](./story-2.2-post-crud.md)
