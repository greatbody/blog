# Story 1.2: Session Management

**Epic:** EPIC-1: Authentication & Security  
**Priority:** P0 (Must Have)  
**Story Points:** 3

## User Story

**As a** blog owner  
**I want** secure session management  
**So that** my authentication state persists safely across requests

## Acceptance Criteria

### 1. Session Configuration
- [x] Rails session store configured to use encrypted cookies (Rails default)
- [ ] Session cookie marked as `httponly` and `secure` in production
- [ ] Session timeout set to 14 days
- [x] Session secret key rotated and stored in credentials

### 2. Session Persistence
- [x] User remains authenticated across browser sessions (within timeout)
- [x] Closing browser doesn't log user out
- [ ] Session automatically expires after 14 days of inactivity

### 3. Session Security
- [x] Session cookies not accessible via JavaScript (Rails default)
- [ ] Session cookies only sent over HTTPS in production
- [x] No session fixation vulnerabilities (Rails handles this)
- [x] Session ID regenerated on login (Rails default)

## Technical Notes

- Use Rails' encrypted cookie store (default in Rails 7+)
- Configure in `config/application.rb` or environment files
- Ensure `force_ssl` is enabled in production

## Definition of Done

- [ ] All acceptance criteria met
- [ ] Security audit of session configuration
- [ ] Tests verify session timeout behavior
- [ ] Documentation updated

## Dependencies

- [Story 1.1: GitHub OAuth Integration](./story-1.1-github-oauth.md) must be completed

## Related Stories

- [Story 1.1: GitHub OAuth Integration](./story-1.1-github-oauth.md)
