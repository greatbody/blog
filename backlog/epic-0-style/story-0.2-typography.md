# Story 0.2: Typography System

## Story
**As a** reader
**I want** beautiful, highly readable typography
**So that** I can comfortably read long-form technical articles

## Priority: P0 (Must Have)
## Story Points: 5

---

## Description
Implement a comprehensive typography system optimized for technical blog content. This includes heading styles, body text, inline code, links, lists, blockquotes, and other text elements with excellent readability and visual hierarchy.

## Acceptance Criteria
- [ ] All heading levels (H1-H6) styled with clear hierarchy
- [ ] Body text optimized for readability (18px, 1.7 line height, max-width 720px)
- [ ] Inline code styling distinct from body text
- [ ] Links styled with clear hover/focus/active states
- [ ] Blockquotes visually distinct and elegant
- [ ] Lists (ordered/unordered) properly formatted
- [ ] Strong and emphasis tags styled
- [ ] Horizontal rules (hr) styled
- [ ] Text selection color customized
- [ ] Proper vertical rhythm maintained (consistent spacing)

## Technical Details

### Typography Scale Implementation
```css
/* Headings */
h1, h2, h3, h4, h5, h6 {
  font-family: var(--font-sans);
  font-weight: 700;
  line-height: var(--line-height-tight);
  color: var(--color-text-primary);
  margin-top: var(--space-2xl);
  margin-bottom: var(--space-md);
  letter-spacing: -0.02em;
}

h1 {
  font-size: var(--font-size-3xl); /* 40px */
  margin-top: var(--space-3xl);
}

h2 {
  font-size: var(--font-size-2xl); /* 32px */
}

h3 {
  font-size: var(--font-size-xl); /* 24px */
}

h4 {
  font-size: var(--font-size-lg); /* 20px */
}

/* Body text */
p {
  margin-top: 0;
  margin-bottom: var(--space-lg);
}

/* Inline code */
code {
  font-family: var(--font-mono);
  font-size: 0.95em;
  background-color: var(--color-code-bg);
  padding: 2px 6px;
  border-radius: var(--border-radius-sm);
  color: var(--color-text-primary);
}

/* Links */
a {
  color: var(--color-accent);
  text-decoration: underline;
  text-decoration-thickness: 1px;
  text-underline-offset: 2px;
  transition: color var(--transition-fast);
}

a:hover {
  color: var(--color-accent-hover);
}

/* Blockquotes */
blockquote {
  margin: var(--space-2xl) 0;
  padding: var(--space-md) var(--space-xl);
  border-left: 4px solid var(--color-accent);
  background-color: var(--color-bg-secondary);
  font-style: italic;
  color: var(--color-text-secondary);
}

blockquote p:last-child {
  margin-bottom: 0;
}
```

### Content Width Container
```css
.prose {
  max-width: var(--max-width-content);
  margin: 0 auto;
  padding: 0 var(--space-lg);
}

@media (min-width: 768px) {
  .prose {
    padding: 0 var(--space-2xl);
  }
}
```

### Typography Features
- **Optical Sizing**: Use font-size adjustments for better readability
- **Line Length**: Max 720px (60-80 characters per line)
- **Line Height**: 1.7 for body text (excellent for reading)
- **Letter Spacing**: Slight negative for headings (-0.02em)
- **Text Selection**: Custom color for better UX
- **Hyphenation**: Avoid for technical content (code snippets break)

## Tasks
1. Define heading styles (H1-H6) with proper hierarchy
2. Style body text with optimal line-height and spacing
3. Implement inline code styling
4. Create link styles with hover/focus states
5. Style blockquotes with visual distinction
6. Format lists (ul, ol) with proper indentation
7. Add styles for strong, em, mark, del tags
8. Implement horizontal rule (hr) styling
9. Create .prose utility class for content areas
10. Test typography on various screen sizes
11. Verify reading experience with actual blog content

## Testing Checklist
- [ ] Text is readable at mobile sizes (320px+)
- [ ] Line length doesn't exceed 80 characters on desktop
- [ ] Headings create clear visual hierarchy
- [ ] Inline code is distinguishable from regular text
- [ ] Links are obvious and accessible (color contrast ≥ 4.5:1)
- [ ] Blockquotes are visually distinct
- [ ] Text selection color is pleasant
- [ ] No orphans/widows in headings (test with real content)
- [ ] All typography scales proportionally on smaller screens

## Dependencies
- Story 0.1: Design System Foundation (requires CSS custom properties)

## Related Stories
- Story 0.5: Code Block Styling (complements typography)
- Story 2.3: Markdown Rendering (applies these styles)

## Design References
- [Practical Typography](https://practicaltypography.com/)
- [Better Web Type](https://betterwebtype.com/)
- [Web Typography](http://webtypography.net/)
- [The Elements of Typographic Style](https://en.wikipedia.org/wiki/The_Elements_of_Typographic_Style)

## Readability Guidelines
- **Line Length**: 45-75 characters (optimal ~66)
- **Line Height**: 1.4-1.7 for body text (use 1.7 for comfort)
- **Font Size**: 16-18px minimum for body text (use 18px)
- **Contrast**: WCAG AA minimum 4.5:1 (we use near-black on white)
- **Whitespace**: Generous margins and padding between elements

## Performance Notes
- Use system fonts (no web font downloads)
- Consider using JetBrains Mono via CDN or self-hosted for code
- Total CSS for typography should be < 5KB

## Notes
- Prioritize readability over aesthetics
- Test with actual long-form technical content
- Consider reader fatigue for 2000+ word articles
- Ensure code snippets within prose flow naturally
