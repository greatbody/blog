# EPIC-4: Performance Optimization

## Overview
Fast page loads (<1s), caching, minimal assets to ensure excellent user experience.

## Goals
- Page load times under 1 second
- Aggressive Rails caching for rendered content
- Minimal and optimized assets (CSS/JS)
- Optimized database queries
- Performance monitoring and tracking

## Stories
1. [Story 4.1: Rails Caching Strategy](./story-4.1-caching.md) - 8 points
2. [Story 4.2: Asset Optimization](./story-4.2-assets.md) - 5 points
3. [Story 4.3: Database Query Optimization](./story-4.3-queries.md) - 5 points
4. [Story 4.4: Performance Monitoring](./story-4.4-monitoring.md) - 5 points

## Total Story Points: 23

## Performance Targets
- Homepage load: <500ms (server time)
- Post page load: <300ms (server time)
- Lighthouse score: 90+ (desktop), 85+ (mobile)
- Total page size: <100KB (HTML + CSS + JS)

## Technical Notes
- Use Rails file store for caching (simple, no Redis)
- System fonts only (no web fonts)
- No images policy (text-only)
- Minimize HTTP requests
