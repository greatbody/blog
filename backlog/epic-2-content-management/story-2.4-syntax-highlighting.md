# Story 2.4: Syntax Highlighting

**Epic:** EPIC-2: Content Management  
**Priority:** P1 (Should Have)  
**Story Points:** 8

## User Story

**As a** blog reader  
**I want** code blocks to have syntax highlighting  
**So that** code examples are readable and professional

## Acceptance Criteria

### 1. Rouge Integration
- [x] Custom Redcarpet renderer class extends `Redcarpet::Render::HTML`
- [x] Override `block_code(code, language)` method
- [x] Use Rouge lexer to highlight code based on language
- [x] Return highlighted HTML wrapped in `<pre><code>` with CSS classes

### 2. Language Support
- [x] Support 100+ languages via Rouge (Ruby, Python, JavaScript, Go, Rust, Java, C, C++, etc.)
- [x] Gracefully handle unknown languages (render as plain text)
- [x] Language specified in fenced code blocks: ` ```ruby `

### 3. Styling
- [x] Generate Rouge CSS theme file: `rouge.css`
- [x] Include CSS in application layout
- [x] Use GitHub theme for consistency
- [x] Ensure code is readable (good contrast, appropriate font)

### 4. Code Block Rendering
- [x] Code blocks have appropriate syntax highlighting
- [x] Language label not displayed (optional enhancement)
- [x] Line numbers not required (keep simple)
- [x] Code is selectable and copyable

### 5. Performance
- [x] Syntax highlighting done server-side (no client JS)
- [ ] Highlighted HTML cached with post content (use Rails fragment caching)
- [x] No performance impact on page load (<50ms per post)

## Example

**Input:**
````markdown
```ruby
def hello
  puts "Hello, World!"
end
```
````

**Output:**
```html
<pre class="highlight">
  <code class="language-ruby">
    <span class="k">def</span> <span class="nf">hello</span>
      <span class="nb">puts</span> <span class="s2">"Hello, World!"</span>
    <span class="k">end</span>
  </code>
</pre>
```

## Technical Implementation

```ruby
# app/helpers/application_helper.rb
class CustomRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    language ||= 'text'
    lexer = Rouge::Lexer.find_fancy(language, code) || Rouge::Lexers::PlainText.new
    formatter = Rouge::Formatters::HTML.new
    formatter.format(lexer.lex(code))
  end
end

def markdown(text)
  renderer = CustomRenderer.new(hard_wrap: true)
  options = {
    autolink: true,
    tables: true,
    fenced_code_blocks: true,
    strikethrough: true,
    no_intra_emphasis: true
  }
  Redcarpet::Markdown.new(renderer, options).render(text).html_safe
end
```

## Definition of Done

- [ ] All acceptance criteria met
- [ ] Tests verify highlighting for 5+ languages (Ruby, Python, JavaScript, Go, SQL)
- [ ] Performance benchmarked (page load time)
- [ ] Sample posts with various languages created
- [ ] CSS theme integrated and tested

## Dependencies

- [Story 2.3: Markdown Rendering](./story-2.3-markdown-rendering.md)

## Related Stories

- [Story 4.1: Rails Caching Strategy](../epic-4-performance/story-4.1-caching.md)
