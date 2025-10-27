# Story 1.1: GitHub OAuth Integration

**Epic:** EPIC-1: Authentication & Security  
**Priority:** P0 (Must Have)  
**Story Points:** 8

## User Story

**As a** blog owner  
**I want** to protect my blog with GitHub OAuth  
**So that** only authenticated users can access the content

## Acceptance Criteria

### 1. OAuth Provider Setup
- [x] OmniAuth gem installed and configured in `config/initializers/omniauth.rb`
- [x] GitHub OAuth application created with client ID and secret
- [x] Callback URL configured as `/auth/github/callback`
- [x] Environment variables set for `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET`

### 2. User Model
- [x] `User` model created with fields:
  - `provider` (string)
  - `uid` (string)
  - `name` (string)
  - `email` (string)
  - `avatar_url` (string)
  - `created_at` (datetime)
  - `updated_at` (datetime)
- [x] Database migration executed successfully
- [x] No sensitive OAuth tokens stored in database

### 3. Authentication Flow
- [x] Route `/auth/github` initiates OAuth flow
- [x] Callback route `/auth/github/callback` processes OAuth response
- [x] `SessionsController` handles OAuth callback and creates session
- [x] User record created or updated on successful authentication
- [x] Session stored using Rails' secure encrypted session cookies

### 4. Authorization Guards
- [x] `ApplicationController` implements `authenticate_user!` method
- [x] `before_action :authenticate_user!` applied to all controllers requiring authentication
- [x] Unauthenticated requests redirect to `/auth/github`
- [x] Current user accessible via `current_user` helper method

### 5. Logout Functionality
- [x] `/logout` route destroys session
- [x] User redirected to login page after logout
- [x] Session cleared completely

### 6. Error Handling
- [x] OAuth failures display clear error message
- [x] Invalid OAuth state handled gracefully
- [x] Network errors during OAuth flow handled without crashes

## Technical Notes

- Use OmniAuth's built-in CSRF protection
- No custom authentication logic—leverage Rails conventions
- Session timeout: 2 weeks of inactivity

## Definition of Done

- [ ] All acceptance criteria met
- [ ] Unit tests for SessionsController (create, destroy actions)
- [ ] Integration test for full OAuth flow
- [ ] Documentation in README for OAuth setup
- [ ] Manually tested with GitHub account

## Dependencies

- GitHub OAuth application must be registered
- OmniAuth gem installed

## Related Stories

- [Story 1.2: Session Management](./story-1.2-session-management.md)
