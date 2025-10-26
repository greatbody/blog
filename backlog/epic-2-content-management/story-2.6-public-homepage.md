# Story 2.6: Public Homepage

**Epic:** EPIC-2: Content Management  
**Priority:** P1 (Should Have)  
**Story Points:** 5

## User Story

**As a** blog reader  
**I want** a homepage listing all published posts  
**So that** I can browse available content

## Acceptance Criteria

### 1. Homepage Route
- [ ] Root URL `/` routes to `home#index`
- [ ] No authentication required (public access)
- [ ] Controller: `HomeController`, Action: `index`

### 2. Post Listing
- [ ] Displays all published posts only (uses `Post.published` scope)
- [ ] Sorted by `published_at` descending (newest first)
- [ ] Pagination: 20 posts per page (use `kaminari` gem or simple offset/limit)
- [ ] Each post shows:
  - Title (linked to post)
  - Published date (formatted: "Jan 15, 2025")
  - Excerpt (first 200 characters of content, plain text)

### 3. Post Links
- [ ] Clicking title navigates to `/posts/:slug`
- [ ] "Read more →" link on each excerpt
- [ ] Links open in same tab

### 4. Empty State
- [ ] If no published posts, show message: "No posts yet. Check back soon!"
- [ ] Do not show admin actions on public homepage

### 5. Layout
- [ ] Simple, clean design (semantic HTML)
- [ ] Responsive: stacks on mobile
- [ ] No images—text-only
- [ ] Optional: Subtle dividers between posts

## Technical Implementation

**Controller:**
```ruby
# app/controllers/home_controller.rb
class HomeController < ApplicationController
  skip_before_action :authenticate_user! # Public access
  
  def index
    @posts = Post.published.order(published_at: :desc).page(params[:page]).per(20)
  end
end
```

**View:**
```erb
<!-- app/views/home/index.html.erb -->
<h1>Blog</h1>

<% if @posts.any? %>
  <% @posts.each do |post| %>
    <article>
      <h2><%= link_to post.title, post_path(post) %></h2>
      <time><%= post.published_at.strftime("%b %d, %Y") %></time>
      <p><%= truncate(strip_tags(markdown(post.content)), length: 200) %></p>
      <%= link_to "Read more →", post_path(post) %>
    </article>
  <% end %>
  <%= paginate @posts %>
<% else %>
  <p>No posts yet. Check back soon!</p>
<% end %>
```

**Routes:**
```ruby
root 'home#index'
```

## Definition of Done

- [ ] All acceptance criteria met
- [ ] Controller and view tests
- [ ] Integration test for homepage visit
- [ ] Tested with 0, 1, and 50 posts
- [ ] Manual testing on mobile device

## Dependencies

- [Story 2.2: Post CRUD Operations](./story-2.2-post-crud.md)
- [Story 2.3: Markdown Rendering](./story-2.3-markdown-rendering.md)

## Related Stories

- [Story 2.7: RSS Feed](./story-2.7-rss-feed.md)
