# EPIC-1: Authentication & Security

## Overview
GitHub OAuth-based Single Sign-On to protect blog access. This epic ensures that only authenticated users can access the blog content while maintaining secure session management.

## Goals
- Implement GitHub OAuth integration using OmniAuth
- Secure session management with encrypted cookies
- Protect all routes requiring authentication
- Simple logout functionality

## Stories
1. [Story 1.1: GitHub OAuth Integration](./story-1.1-github-oauth.md) - 8 points
2. [Story 1.2: Session Management](./story-1.2-session-management.md) - 3 points

## Total Story Points: 11

## Dependencies
- GitHub OAuth application must be created
- Environment variables for client ID and secret
- Rails session configuration

## Technical Notes
- Use OmniAuth gem with GitHub strategy
- No custom authentication logic—leverage Rails conventions
- Session timeout: 2 weeks of inactivity
- HTTPS enforced in production for secure cookies
