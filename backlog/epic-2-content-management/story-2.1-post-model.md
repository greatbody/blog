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
- [x] `title`: string, required, max 255 characters
- [x] `content`: text, required (stores Markdown)
- [x] `slug`: string, unique, indexed, auto-generated from title
- [x] `published`: boolean, default false
- [x] `published_at`: datetime, nullable
- [x] `created_at`, `updated_at`: timestamps

### 2. Validations
- [x] Title presence validated
- [x] Title length <= 255 characters
- [x] Content presence validated
- [x] Slug uniqueness validated
- [x] Slug automatically generated from title using parameterize

### 3. Model Methods
- [x] `published` scope returns only published posts
- [x] `draft` scope returns unpublished posts
- [x] `publish!` method sets published=true and published_at=now
- [x] `unpublish!` method sets published=false

### 4. Database
- [x] SQLite database configured in development and production
- [x] Migration creates posts table with all fields
- [x] Index on slug column
- [x] Index on published_at column
- [x] No foreign key constraints (application-level integrity only)

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
