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
- [ ] Rails session store configured to use encrypted cookies
- [ ] Session cookie marked as `httponly` and `secure` in production
- [ ] Session timeout set to 14 days
- [ ] Session secret key rotated and stored in credentials

### 2. Session Persistence
- [ ] User remains authenticated across browser sessions (within timeout)
- [ ] Closing browser doesn't log user out
- [ ] Session automatically expires after 14 days of inactivity

### 3. Session Security
- [ ] Session cookies not accessible via JavaScript
- [ ] Session cookies only sent over HTTPS in production
- [ ] No session fixation vulnerabilities
- [ ] Session ID regenerated on login

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
