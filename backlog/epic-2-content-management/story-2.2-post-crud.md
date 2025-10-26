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
- [ ] Generated via Rails scaffold: `rails g scaffold Post title:string content:text`
- [ ] All CRUD actions: index, show, new, create, edit, update, destroy
- [ ] `before_action :authenticate_user!` protects all actions
- [ ] Strong parameters permit only title and content

### 2. Index Page (Admin View)
- [ ] URL: `/posts`
- [ ] Lists all posts (published and drafts) in table format
- [ ] Columns: Title, Status (Published/Draft), Published Date, Actions
- [ ] Shows "New Post" button
- [ ] Shows Edit and Delete links for each post
- [ ] Posts sorted by created_at descending

### 3. Show Page (Post View)
- [ ] URL: `/posts/:slug` (uses slug, not ID)
- [ ] Displays post title as H1
- [ ] Displays formatted published date
- [ ] Renders Markdown content (raw, no syntax highlighting yet)
- [ ] Shows "Edit" and "Back to Posts" links
- [ ] 404 error if slug not found

### 4. New/Edit Forms
- [ ] URL: `/posts/new` and `/posts/:slug/edit`
- [ ] Form fields: Title (text input), Content (textarea)
- [ ] Checkbox for "Publish"
- [ ] Submit button saves post
- [ ] Cancel button returns to index
- [ ] Validation errors displayed inline
- [ ] Flash messages for success/error

### 5. Create/Update Actions
- [ ] POST `/posts` creates new post
- [ ] PATCH `/posts/:slug` updates existing post
- [ ] Slug auto-generated on create from title
- [ ] If "Publish" checked, calls `post.publish!`
- [ ] Redirects to post show page on success
- [ ] Re-renders form with errors on failure

### 6. Delete Action
- [ ] DELETE `/posts/:slug` destroys post
- [ ] Confirmation dialog: "Are you sure?"
- [ ] Redirects to index with success message
- [ ] Soft delete not required (hard delete OK)

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
