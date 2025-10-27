# Story 0.1: Design System Foundation

## Story
**As a** developer  
**I want** a documented design system with CSS custom properties and base styles  
**So that** I have a consistent foundation for all UI components

## Priority: P0 (Must Have)
## Story Points: 5

---

## Description
Establish the foundational CSS architecture including CSS custom properties (CSS variables) for colors, spacing, typography, and other design tokens. Create base styles for HTML elements and a reset/normalize layer.

## Acceptance Criteria
- [ ] CSS custom properties defined for all design tokens:
  - Colors (background, text, borders, accents)
  - Spacing scale (xs, sm, md, lg, xl, 2xl, 3xl)
  - Typography (font families, sizes, weights, line heights)
  - Border radius values
  - Shadow styles
  - Transitions/animations
- [ ] CSS reset/normalize applied (use modern-normalize or custom)
- [ ] Base HTML element styles (html, body, headers, paragraphs, lists)
- [ ] Box-sizing set to border-box globally
- [ ] Focus styles defined for accessibility
- [ ] Print styles (optional but recommended)
- [ ] Design tokens documented in comments or separate file

## Technical Details

### File Structure
```
app/assets/stylesheets/
├── application.css
├── design_system/
│   ├── _reset.css
│   ├── _tokens.css
│   ├── _base.css
│   └── _utilities.css
```

### CSS Custom Properties Structure
```css
:root {
  /* Colors */
  --color-bg-primary: #FFFFFF;
  --color-bg-secondary: #F8F9FA;
  --color-text-primary: #1A1A1A;
  --color-text-secondary: #6B7280;
  --color-accent: #3B82F6;
  --color-accent-hover: #2563EB;
  --color-border: #E5E7EB;
  --color-code-bg: #F3F4F6;
  
  /* Spacing */
  --space-xs: 4px;
  --space-sm: 8px;
  --space-md: 16px;
  --space-lg: 24px;
  --space-xl: 32px;
  --space-2xl: 48px;
  --space-3xl: 64px;
  
  /* Typography */
  --font-sans: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
  --font-mono: 'JetBrains Mono', 'Fira Code', Monaco, Consolas, monospace;
  --font-size-xs: 0.75rem;
  --font-size-sm: 0.875rem;
  --font-size-base: 1.125rem;
  --font-size-lg: 1.25rem;
  --font-size-xl: 1.5rem;
  --font-size-2xl: 2rem;
  --font-size-3xl: 2.5rem;
  --line-height-tight: 1.2;
  --line-height-normal: 1.5;
  --line-height-relaxed: 1.7;
  
  /* Layout */
  --max-width-content: 720px;
  --max-width-wide: 1200px;
  --border-radius-sm: 4px;
  --border-radius-md: 8px;
  --border-radius-lg: 12px;
  
  /* Shadows */
  --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
  --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
  
  /* Transitions */
  --transition-fast: 150ms ease;
  --transition-base: 200ms ease;
  --transition-slow: 300ms ease;
}
```

### Base Styles
```css
html {
  font-size: 16px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

body {
  font-family: var(--font-sans);
  font-size: var(--font-size-base);
  line-height: var(--line-height-relaxed);
  color: var(--color-text-primary);
  background-color: var(--color-bg-primary);
  margin: 0;
  padding: 0;
}

/* Focus styles for accessibility */
*:focus-visible {
  outline: 2px solid var(--color-accent);
  outline-offset: 2px;
}
```

## Tasks
1. Install modern-normalize gem or create custom reset
2. Create design_system directory structure
3. Define all CSS custom properties in _tokens.css
4. Implement base HTML element styles in _base.css
5. Create utility classes for common patterns in _utilities.css
6. Import design system files in correct order in application.css
7. Test CSS custom properties work in all target browsers
8. Document design token usage for team

## Testing Checklist
- [ ] Design tokens render correctly across Chrome, Firefox, Safari
- [ ] Focus states visible and accessible with keyboard navigation
- [ ] No browser-specific rendering issues
- [ ] CSS validates (W3C CSS Validator)
- [ ] Variables can be overridden for theming (future dark mode)

## Dependencies
- None (foundational story)

## Related Stories
- Story 0.2: Typography System (uses design tokens)
- Story 0.3: Component Library (builds on foundation)

## Design References
- System font stacks: https://systemfontstack.com/
- CSS custom properties: https://developer.mozilla.org/en-US/docs/Web/CSS/--*
- modern-normalize: https://github.com/sindresorhus/modern-normalize

## Notes
- Keep CSS bundle small - avoid over-engineering
- Use native CSS features over preprocessors where possible
- Consider prefers-reduced-motion for animations
- Design tokens should be semantic (e.g., `--color-text-primary` not `--color-gray-900`)
