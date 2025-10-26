# EPIC-3: Self-Hosted Analytics

## Overview
Complete analytics system tracking page views, user behavior, and performance metrics. All data stored locally in SQLite with no third-party services.

## Goals
- Track page views, unique visitors, and sessions
- Capture user interactions (clicks, scroll depth, reading time)
- Privacy-compliant tracking with IP hashing and DNT support
- Admin dashboard showing key metrics
- Automated data retention (90-day cleanup)

## Stories
1. [Story 3.1: Analytics Data Models](./story-3.1-analytics-models.md) - 5 points
2. [Story 3.2: Page View Tracking](./story-3.2-pageview-tracking.md) - 8 points
3. [Story 3.3: Client-Side Event Tracking](./story-3.3-event-tracking.md) - 8 points
4. [Story 3.4: Analytics Dashboard](./story-3.4-analytics-dashboard.md) - 13 points
5. [Story 3.5: Data Retention and Privacy](./story-3.5-data-privacy.md) - 5 points

## Total Story Points: 39

## Dependencies
- SQLite database configured
- ActiveJob for async processing
- Browser gem for user-agent parsing

## Technical Notes
- Never store raw IP addresses (only SHA256 hashes)
- Respect DNT (Do Not Track) header
- Async tracking to avoid blocking requests
- Keep JavaScript minimal (<5KB)
- No external analytics services
