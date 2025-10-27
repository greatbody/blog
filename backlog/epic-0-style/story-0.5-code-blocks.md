# Story 0.5: Code Block Styling

## Story
**As a** reader  
**I want** beautifully formatted code blocks with syntax highlighting  
**So that** I can easily read and understand technical code examples

## Priority: P0 (Must Have)
## Story Points: 5

---

## Description
Implement elegant styling for code blocks that complements the syntax highlighting system. Focus on readability, proper spacing, and professional appearance for technical content. Code blocks should have line numbers, copy button, and optional language labels.

## Acceptance Criteria
- [ ] Code blocks visually distinct from body content
- [ ] Proper padding and spacing around code
- [ ] Horizontal scrolling for long lines (no wrap)
- [ ] Line numbers displayed (optional, configurable)
- [ ] Copy button to copy code to clipboard
- [ ] Language label displayed (e.g., "Ruby", "JavaScript")
- [ ] Inline code styled differently from code blocks
- [ ] Code blocks work on mobile (horizontal scroll)
- [ ] Monospace font optimized for code readability
- [ ] Syntax highlighting integration ready (colors defined)
- [ ] Proper contrast for accessibility

## Technical Details

### Base Code Block Styling
```css
pre {
  margin: var(--space-xl) 0;
  padding: var(--space-lg);
  background-color: var(--color-code-bg);
  border: 1px solid var(--color-border);
  border-radius: var(--border-radius-md);
  overflow-x: auto;
  -webkit-overflow-scrolling: touch;
}

pre code {
  font-family: var(--font-mono);
  font-size: 0.95rem;
  line-height: 1.6;
  color: var(--color-text-primary);
  background: none;
  padding: 0;
  display: block;
}

/* Inline code (already defined in typography) */
code {
  font-family: var(--font-mono);
  font-size: 0.95em;
  background-color: var(--color-code-bg);
  padding: 2px 6px;
  border-radius: var(--border-radius-sm);
  color: var(--color-text-primary);
}

/* Don't double-style code inside pre */
pre code {
  background: none;
  padding: 0;
  border-radius: 0;
}
```

### Code Block Container with Header
```css
.code-block {
  position: relative;
  margin: var(--space-xl) 0;
}

.code-block-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: var(--space-sm) var(--space-md);
  background-color: var(--color-bg-secondary);
  border: 1px solid var(--color-border);
  border-bottom: none;
  border-radius: var(--border-radius-md) var(--border-radius-md) 0 0;
}

.code-block-language {
  font-family: var(--font-sans);
  font-size: var(--font-size-sm);
  font-weight: 600;
  color: var(--color-text-secondary);
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.code-block-copy {
  font-family: var(--font-sans);
  font-size: var(--font-size-sm);
  padding: var(--space-xs) var(--space-sm);
  background: none;
  border: 1px solid var(--color-border);
  border-radius: var(--border-radius-sm);
  color: var(--color-text-secondary);
  cursor: pointer;
  transition: all var(--transition-fast);
}

.code-block-copy:hover {
  background-color: white;
  color: var(--color-accent);
  border-color: var(--color-accent);
}

.code-block pre {
  margin: 0;
  border-radius: 0 0 var(--border-radius-md) var(--border-radius-md);
  border-top: none;
}
```

### Line Numbers (Optional)
```css
.code-block-with-lines {
  display: grid;
  grid-template-columns: auto 1fr;
}

.code-line-numbers {
  padding: var(--space-lg) var(--space-sm);
  background-color: var(--color-bg-secondary);
  border-right: 1px solid var(--color-border);
  text-align: right;
  user-select: none;
  color: var(--color-text-secondary);
  font-family: var(--font-mono);
  font-size: 0.95rem;
  line-height: 1.6;
}

.code-line-numbers span {
  display: block;
}

.code-block-with-lines pre {
  margin: 0;
  border-left: none;
  border-radius: 0 var(--border-radius-md) var(--border-radius-md) 0;
}
```

### Syntax Highlighting Color Scheme (Light Theme)
```css
/* Base syntax highlighting for common tokens */
.highlight {
  background: var(--color-code-bg);
}

/* Comments */
.highlight .c,
.highlight .cm,
.highlight .c1 {
  color: #6B7280;
  font-style: italic;
}

/* Keywords */
.highlight .k,
.highlight .kd,
.highlight .kn,
.highlight .kr {
  color: #9333EA;
  font-weight: 600;
}

/* Strings */
.highlight .s,
.highlight .s1,
.highlight .s2 {
  color: #059669;
}

/* Numbers */
.highlight .m,
.highlight .mi,
.highlight .mf {
  color: #DC2626;
}

/* Functions */
.highlight .nf,
.highlight .fm {
  color: #2563EB;
}

/* Variables */
.highlight .n,
.highlight .na {
  color: #1A1A1A;
}

/* Operators */
.highlight .o {
  color: #9333EA;
}

/* Built-ins */
.highlight .nb {
  color: #EA580C;
}

/* Classes */
.highlight .nc {
  color: #2563EB;
  font-weight: 600;
}
```

### Responsive Code Blocks
```css
@media (max-width: 767px) {
  pre {
    padding: var(--space-md);
    font-size: 0.875rem;
    border-radius: var(--border-radius-sm);
  }
  
  .code-block-header {
    padding: var(--space-xs) var(--space-sm);
  }
  
  .code-block-language {
    font-size: 0.75rem;
  }
  
  .code-line-numbers {
    padding: var(--space-md) var(--space-xs);
  }
}
```

### Copy Button JavaScript (Stimulus Controller)
```javascript
// app/javascript/controllers/code_copy_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["source", "button"]
  
  copy() {
    const code = this.sourceTarget.textContent
    navigator.clipboard.writeText(code).then(() => {
      const originalText = this.buttonTarget.textContent
      this.buttonTarget.textContent = "Copied!"
      
      setTimeout(() => {
        this.buttonTarget.textContent = originalText
      }, 2000)
    })
  }
}
```

### HTML Structure Example
```erb
<div class="code-block" data-controller="code-copy">
  <div class="code-block-header">
    <span class="code-block-language">Ruby</span>
    <button class="code-block-copy" 
            data-code-copy-target="button"
            data-action="click->code-copy#copy">
      Copy
    </button>
  </div>
  <pre><code data-code-copy-target="source">class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
end</code></pre>
</div>
```

## Font Recommendations for Code

### Primary Choice: JetBrains Mono
- Excellent readability for code
- Free and open source
- Ligature support (optional)
- Good character distinction (0 vs O, 1 vs l)

### Fallback Stack
```css
--font-mono: 'JetBrains Mono', 'Fira Code', 'SF Mono', Monaco, Consolas, 
             'Liberation Mono', 'Courier New', monospace;
```

### Self-Hosting vs CDN
- **Self-host** for better performance (no external request)
- **CDN** for easier setup (Google Fonts or similar)
- Only load Regular and Medium weights (reduce size)

## Tasks
1. Create base code block styles (pre, code)
2. Implement code block container with header
3. Add language label display
4. Create copy button styling
5. Implement line numbers (optional feature)
6. Define syntax highlighting color scheme
7. Make code blocks responsive (mobile scroll)
8. Create Stimulus controller for copy functionality
9. Integrate with Rouge/syntax highlighting gem
10. Test code blocks with various languages
11. Test horizontal scrolling on mobile
12. Verify accessibility (keyboard nav, screen readers)

## Testing Checklist
- [ ] Code blocks display with proper spacing
- [ ] Horizontal scroll works on mobile (no line wrapping)
- [ ] Copy button successfully copies code
- [ ] Language labels display correctly
- [ ] Line numbers align with code (if enabled)
- [ ] Syntax colors have sufficient contrast (WCAG AA)
- [ ] Inline code distinguishable from code blocks
- [ ] Code blocks work without JavaScript (progressive enhancement)
- [ ] Test with very long lines (>120 characters)
- [ ] Test with various languages (Ruby, JS, Python, HTML, etc.)
- [ ] Keyboard navigation works (Tab, Shift+Tab)

## Dependencies
- Story 0.1: Design System Foundation
- Story 0.2: Typography System
- Story 2.4: Syntax Highlighting (for color scheme integration)

## Related Stories
- Story 2.3: Markdown Rendering (renders code blocks)
- Story 2.4: Syntax Highlighting (adds color tokens)

## Accessibility Requirements
- Sufficient color contrast for all syntax colors (4.5:1 minimum)
- Copy button keyboard accessible
- Screen reader announces code block purpose
- Line numbers not read by screen readers (aria-hidden)
- Code can be selected and copied manually

## Performance Considerations
- Load monospace font efficiently (woff2 format)
- Subset font to only needed characters
- Consider system font fallback (SF Mono, Consolas)
- CSS for code blocks should be < 5KB
- Lazy load copy button JavaScript if needed

## Design References
- [GitHub code blocks](https://github.com/)
- [MDN Web Docs code styling](https://developer.mozilla.org/)
- [freeCodeCamp code blocks](https://www.freecodecamp.org/)
- [CSS-Tricks code display](https://css-tricks.com/)

## Color Palette Guidelines
For light theme, syntax colors should:
- Have sufficient contrast against light background
- Use familiar conventions (green for strings, purple for keywords)
- Not be overly bright or saturated
- Work well together as a cohesive palette
- Support common languages (Ruby, JS, Python, HTML, CSS, SQL)

## Notes
- Consider adding diff highlighting (+/- lines) for future
- May want to add line highlight feature (highlight specific lines)
- Copy button should show feedback (tooltip or text change)
- Test with actual blog post content, not just examples
- Ensure code blocks don't break layout on mobile
