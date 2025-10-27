# Story 2.3: Markdown Rendering

**Epic:** EPIC-2: Content Management  
**Priority:** P0 (Must Have)  
**Story Points:** 5

## User Story

**As a** blog owner  
**I want** posts to support Markdown formatting  
**So that** I can write rich-formatted content easily

## Acceptance Criteria

### 1. Gem Integration
- [x] `redcarpet` gem added to Gemfile
- [x] `rouge` gem added to Gemfile (for syntax highlighting)
- [x] Bundle installed

### 2. Markdown Helper
- [x] Helper method `markdown(text)` in `ApplicationHelper`
- [x] Uses Redcarpet renderer with options:
  - `autolink: true`
  - `tables: true`
  - `fenced_code_blocks: true`
  - `strikethrough: true`
  - `no_intra_emphasis: true`
  - `hard_wrap: true`
- [x] Returns HTML-safe string

### 3. Post Rendering
- [x] `posts/show.html.erb` uses `markdown(post.content)` to render content
- [x] Markdown converted to semantic HTML
- [x] Links are clickable
- [x] Tables render properly
- [x] Inline code uses `<code>` tags
- [x] Block code uses `<pre><code>` tags

### 4. Supported Markdown Features
- [x] Headers (H1-H6)
- [x] Bold, italic, strikethrough
- [x] Unordered and ordered lists
- [x] Links and images
- [x] Blockquotes
- [x] Inline code and code blocks
- [x] Tables
- [x] Horizontal rules

### 5. HTML Sanitization
- [x] Raw HTML in Markdown is escaped for security
- [x] Only safe tags allowed (no `<script>`, `<iframe>`, etc.)
- [x] Use Rails' `sanitize` helper if needed

## Example

**Input (Markdown):**
```markdown
# Hello World

This is **bold** and this is *italic*.

- Item 1
- Item 2

`inline code` and block code:

\```ruby
def hello
  puts "World"
end
\```
```

**Output (HTML):**
```html
<h1>Hello World</h1>
<p>This is <strong>bold</strong> and this is <em>italic</em>.</p>
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
</ul>
<p><code>inline code</code> and block code:</p>
<pre><code class="ruby">def hello
  puts "World"
end
</code></pre>
```

## Definition of Done

- [ ] All acceptance criteria met
- [ ] Helper unit tests with various Markdown samples
- [ ] View tests verify Markdown rendered as HTML
- [ ] Security tested (XSS attempts blocked)
- [ ] Sample posts created with Markdown features

## Dependencies

- [Story 2.2: Post CRUD Operations](./story-2.2-post-crud.md)

## Related Stories

- [Story 2.4: Syntax Highlighting](./story-2.4-syntax-highlighting.md)
