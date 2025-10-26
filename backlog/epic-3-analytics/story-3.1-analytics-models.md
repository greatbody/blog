# Story 3.1: Analytics Data Models

**Epic:** EPIC-3: Self-Hosted Analytics  
**Priority:** P1 (Should Have)  
**Story Points:** 5

## User Story

**As a** developer  
**I want** models to track analytics data  
**So that** page views, sessions, and events can be stored

## Acceptance Criteria

### 1. PageView Model
- [ ] Fields:
  - `path`: string (e.g., "/posts/my-slug")
  - `referrer`: string (nullable)
  - `user_agent`: string
  - `ip_hash`: string (SHA256 hash of IP, never store raw IP)
  - `session_id`: string (from Rails session)
  - `response_time_ms`: integer (nullable)
  - `created_at`: datetime
- [ ] Indexes: `path`, `created_at`, `session_id`
- [ ] No validations required (fast inserts)

### 2. Session Model
- [ ] Fields:
  - `session_id`: string, unique
  - `device_type`: string (mobile/tablet/desktop)
  - `browser`: string (e.g., "Chrome 120")
  - `os`: string (e.g., "macOS 14")
  - `country`: string (nullable, 2-letter code)
  - `first_seen`: datetime
  - `last_seen`: datetime
- [ ] Index: `session_id`, `first_seen`

### 3. Event Model
- [ ] Fields:
  - `event_type`: string (click/scroll/search/read_complete)
  - `target`: string (e.g., link URL, scroll depth %)
  - `metadata`: text (JSON for additional data)
  - `session_id`: string
  - `created_at`: datetime
- [ ] Indexes: `event_type`, `created_at`, `session_id`

### 4. Migrations
- [ ] All three tables created via migrations
- [ ] Indexes applied correctly
- [ ] Migrations reversible

## Technical Implementation

**Generate models:**
```bash
rails g model PageView path:string referrer:string user_agent:string ip_hash:string session_id:string response_time_ms:integer created_at:datetime
rails g model Session session_id:string:uniq device_type:string browser:string os:string country:string first_seen:datetime last_seen:datetime
rails g model Event event_type:string target:string metadata:text session_id:string created_at:datetime
```

**Add indexes in migrations:**
```ruby
add_index :page_views, :path
add_index :page_views, :created_at
add_index :page_views, :session_id
add_index :sessions, :session_id, unique: true
add_index :sessions, :first_seen
add_index :events, :event_type
add_index :events, :created_at
add_index :events, :session_id
```

## Technical Notes

- No foreign keys (application-level integrity only, per requirements)
- Keep models simple—no complex associations or callbacks
- Consider adding `AnalyticsSummary` model in Story 3.4 for caching aggregates

## Definition of Done

- [ ] All acceptance criteria met
- [ ] Migrations run successfully
- [ ] Model tests for basic CRUD
- [ ] Schema documented

## Dependencies

- [Story 5.2: Database Configuration](../epic-5-infrastructure/story-5.2-database-config.md)

## Related Stories

- [Story 3.2: Page View Tracking](./story-3.2-pageview-tracking.md)
