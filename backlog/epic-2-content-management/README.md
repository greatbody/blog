# EPIC-2: Content Management

## Overview
Blog post creation, editing, and display with Markdown and syntax highlighting. This epic covers all functionality related to creating, managing, and displaying blog posts.

## Goals
- Full CRUD operations for blog posts
- Markdown rendering with Redcarpet
- Syntax highlighting for 100+ programming languages
- Live preview editor for writing posts
- Public homepage for readers
- RSS feed for subscribers

## Stories
1. [Story 2.1: Post Model & Database Schema](./story-2.1-post-model.md) - 3 points
2. [Story 2.2: Post CRUD Operations](./story-2.2-post-crud.md) - 8 points
3. [Story 2.3: Markdown Rendering](./story-2.3-markdown-rendering.md) - 5 points
4. [Story 2.4: Syntax Highlighting](./story-2.4-syntax-highlighting.md) - 8 points
5. [Story 2.5: Post Editor with Live Preview](./story-2.5-live-preview.md) - 8 points
6. [Story 2.6: Public Homepage](./story-2.6-public-homepage.md) - 5 points
7. [Story 2.7: RSS Feed](./story-2.7-rss-feed.md) - 3 points

## Total Story Points: 40

## Dependencies
- Authentication must be in place (EPIC-1)
- SQLite database configured (EPIC-5)
- Redcarpet and Rouge gems installed

## Technical Notes
- Use Rails scaffold for initial CRUD
- Server-side Markdown rendering only
- Slug-based URLs instead of IDs
- No images in posts (text-only)
