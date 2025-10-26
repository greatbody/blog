# Story 2.5: Post Editor with Live Preview

**Epic:** EPIC-2: Content Management  
**Priority:** P2 (Nice to Have)  
**Story Points:** 8

## User Story

**As a** blog owner  
**I want** a live Markdown preview in the editor  
**So that** I can see formatted output while writing

## Acceptance Criteria

### 1. Editor Layout
- [ ] Split-pane layout: Markdown input (left) and preview (right)
- [ ] Uses CSS Grid or Flexbox (50/50 split)
- [ ] Responsive: stacks vertically on mobile (<768px)

### 2. Live Preview
- [ ] JavaScript listener on textarea updates preview on input
- [ ] Debounced (300ms) to avoid excessive updates
- [ ] Preview pane shows rendered Markdown with syntax highlighting
- [ ] Preview matches final post appearance

### 3. Preview Endpoint
- [ ] POST `/posts/preview` endpoint in PostsController
- [ ] Accepts `content` parameter
- [ ] Returns rendered HTML (Markdown + syntax highlighting)
- [ ] No authentication required for preview (uses same session)

### 4. JavaScript Implementation
- [ ] Vanilla JS (no frameworks)
- [ ] Fetch API for preview requests
- [ ] Error handling (show message if preview fails)
- [ ] Loading indicator during preview generation

### 5. UX Enhancements
- [ ] Textarea auto-expands with content (min 400px height)
- [ ] Monospace font for textarea
- [ ] Syntax-highlighted preview matches published posts
- [ ] Smooth scroll synchronization (optional)

## Technical Implementation

**Controller:**
```ruby
# app/controllers/posts_controller.rb
def preview
  content = params[:content]
  render json: { html: markdown(content) }
end
```

**Routes:**
```ruby
post '/posts/preview', to: 'posts#preview'
```

**JavaScript:**
```javascript
// app/javascript/live_preview.js
let debounceTimer;
const textarea = document.querySelector('#post_content');
const preview = document.querySelector('#preview');

textarea.addEventListener('input', () => {
  clearTimeout(debounceTimer);
  debounceTimer = setTimeout(() => {
    fetch('/posts/preview', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: JSON.stringify({ content: textarea.value })
    })
    .then(res => res.json())
    .then(data => {
      preview.innerHTML = data.html;
    })
    .catch(err => console.error('Preview failed:', err));
  }, 300);
});
```

## Technical Notes

- Use Rails' Stimulus if it simplifies code without adding complexity
- Cache preview HTML client-side to reduce server requests
- Keep JS <10KB unminified

## Definition of Done

- [ ] All acceptance criteria met
- [ ] JavaScript tested in Chrome, Firefox, Safari
- [ ] Responsive layout tested on mobile
- [ ] Integration test for preview endpoint
- [ ] Accessibility verified (keyboard navigation)

## Dependencies

- [Story 2.4: Syntax Highlighting](./story-2.4-syntax-highlighting.md)

## Related Stories

- [Story 2.2: Post CRUD Operations](./story-2.2-post-crud.md)
