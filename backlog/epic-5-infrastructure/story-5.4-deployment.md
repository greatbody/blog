# Story 5.4: Production Deployment

**Epic:** EPIC-5: Infrastructure & Deployment  
**Priority:** P0 (Must Have)  
**Story Points:** 8

## User Story
**As a** blog owner  
**I want** the blog deployed to production  
**So that** it's accessible on the internet

## Acceptance Criteria
- [ ] Hosting platform configured (Heroku or VPS)
- [ ] Production environment variables set (SECRET_KEY_BASE, GITHUB_CLIENT_ID, etc.)
- [ ] Production database (SQLite on persistent storage)
- [ ] Assets precompiled and served efficiently
- [ ] Database migrations run automatically on deploy
- [ ] HTTPS enabled with SSL certificate
- [ ] force_ssl enabled in production config
- [ ] Custom domain configured (optional)
- [ ] Uptime monitoring setup
- [ ] Deploy and rollback process documented

## Technical Notes
- If Heroku: Use buildpack, configure release phase for migrations
- If VPS: Use Puma + Nginx, Systemd service, Let's Encrypt SSL
- Document deploy process in README

## Definition of Done
- [ ] All acceptance criteria met
- [ ] App deployed and accessible via URL
- [ ] HTTPS working
- [ ] GitHub OAuth works in production
- [ ] All features tested in production
- [ ] Deploy documentation complete

## Dependencies
- All MVP stories must be complete
- [Story 1.1: GitHub OAuth Integration](../epic-1-authentication/story-1.1-github-oauth.md)
