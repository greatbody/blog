# Story 2.2: Post CRUD Operations

**Epic:** EPIC-2: Content Management  
**Priority:** P0 (Must Have)  
**Story Points:** 8

## User Story

**As a** blog owner  
**I want** to create, read, update, and delete posts  
**So that** I can manage my blog content

## Acceptance Criteria

### 1. Posts Controller
- [x] Generated via Rails scaffold: `rails g scaffold Post title:string content:text`
- [x] All CRUD actions: index, show, new, create, edit, update, destroy
- [x] `before_action :authenticate_user!` protects all actions
- [x] Strong parameters permit only title and content

### 2. Index Page (Admin View)
- [x] URL: `/posts`
- [x] Lists all posts (published and drafts) in table format
- [x] Columns: Title, Status (Published/Draft), Published Date, Actions
- [x] Shows "New Post" button
- [x] Shows Edit and Delete links for each post
- [x] Posts sorted by created_at descending

### 3. Show Page (Post View)
- [x] URL: `/posts/:slug` (uses slug, not ID)
- [x] Displays post title as H1
- [x] Displays formatted published date
- [x] Renders Markdown content (with syntax highlighting)
- [x] Shows "Edit" and "Back to Posts" links
- [x] 404 error if slug not found

### 4. New/Edit Forms
- [x] URL: `/posts/new` and `/posts/:slug/edit`
- [x] Form fields: Title (text input), Content (textarea)
- [x] Checkbox for "Publish"
- [x] Submit button saves post
- [x] Cancel button returns to index
- [x] Validation errors displayed inline
- [x] Flash messages for success/error

### 5. Create/Update Actions
- [x] POST `/posts` creates new post
- [x] PATCH `/posts/:slug` updates existing post
- [x] Slug auto-generated on create from title
- [x] If "Publish" checked, calls `post.publish!`
- [x] Redirects to post show page on success
- [x] Re-renders form with errors on failure

### 6. Delete Action
- [x] DELETE `/posts/:slug` destroys post
- [x] Confirmation dialog: "Are you sure?"
- [x] Redirects to index with success message
- [x] Soft delete not required (hard delete OK)

## Routes

```ruby
GET    /posts           -> posts#index
GET    /posts/new       -> posts#new
POST   /posts           -> posts#create
GET    /posts/:slug     -> posts#show
GET    /posts/:slug/edit -> posts#edit
PATCH  /posts/:slug     -> posts#update
DELETE /posts/:slug     -> posts#destroy
```

## Technical Notes

- Override `to_param` method in Post model to use slug instead of ID
- Use `find_by!(slug: params[:id])` in controller

## Definition of Done

- [ ] All acceptance criteria met
- [ ] Controller tests for all 7 RESTful actions
- [ ] View tests for index, show, new, edit
- [ ] Integration tests for full CRUD flow
- [ ] Manual testing completed

## Dependencies

- [Story 2.1: Post Model & Database Schema](./story-2.1-post-model.md)
- [Story 1.1: GitHub OAuth Integration](../epic-1-authentication/story-1.1-github-oauth.md)

## Related Stories

- [Story 2.3: Markdown Rendering](./story-2.3-markdown-rendering.md)
