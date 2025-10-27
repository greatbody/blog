# Story 0.3: Component Library

## Story
**As a** developer
**I want** a library of reusable, styled components
**So that** I can build consistent UI quickly across the application

## Priority: P0 (Must Have)
## Story Points: 8

---

## Description
Create a comprehensive library of reusable UI components following the established design system. Components should be accessible, responsive, and styled consistently with minimal markup requirements.

## Acceptance Criteria
- [ ] Button component (primary, secondary, ghost variants)
- [ ] Form input components (text, textarea, select)
- [ ] Navigation bar component
- [ ] Article card component (for blog post lists)
- [ ] Alert/notification component (success, warning, error)
- [ ] Loading spinner component
- [ ] Empty state component
- [ ] Modal/dialog component (if needed)
- [ ] Footer component
- [ ] Badge/tag component
- [ ] All components are keyboard accessible
- [ ] All components work without JavaScript (where applicable)
- [ ] All components are responsive
- [ ] Component documentation with usage examples

## Component Specifications

### 1. Button Component
**Variants**: Primary, Secondary, Ghost, Danger
**Sizes**: Small, Medium, Large
**States**: Default, Hover, Focus, Active, Disabled, Loading

```css
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  font-family: var(--font-sans);
  font-size: var(--font-size-base);
  font-weight: 600;
  line-height: 1;
  padding: var(--space-sm) var(--space-lg);
  border-radius: var(--border-radius-md);
  border: 2px solid transparent;
  cursor: pointer;
  transition: all var(--transition-base);
  text-decoration: none;
}

.btn-primary {
  background-color: var(--color-accent);
  color: white;
}

.btn-primary:hover {
  background-color: var(--color-accent-hover);
}

.btn-secondary {
  background-color: transparent;
  color: var(--color-accent);
  border-color: var(--color-accent);
}

.btn-ghost {
  background-color: transparent;
  color: var(--color-text-primary);
}

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
```

### 2. Form Inputs
**Types**: Text, Email, Password, Textarea, Select
**States**: Default, Focus, Error, Disabled

```css
.input {
  width: 100%;
  font-family: var(--font-sans);
  font-size: var(--font-size-base);
  padding: var(--space-sm) var(--space-md);
  border: 2px solid var(--color-border);
  border-radius: var(--border-radius-md);
  background-color: white;
  transition: border-color var(--transition-base);
}

.input:focus {
  outline: none;
  border-color: var(--color-accent);
}

.input.error {
  border-color: var(--color-error);
}

.label {
  display: block;
  font-weight: 600;
  margin-bottom: var(--space-xs);
  color: var(--color-text-primary);
}

.form-group {
  margin-bottom: var(--space-lg);
}
```

### 3. Navigation Bar
**Requirements**: Fixed position, minimal height, responsive collapse
**Contents**: Logo/title, nav links, user actions

```css
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 64px;
  background-color: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
  border-bottom: 1px solid var(--color-border);
  z-index: 1000;
}

.navbar-container {
  max-width: var(--max-width-wide);
  height: 100%;
  margin: 0 auto;
  padding: 0 var(--space-lg);
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.navbar-nav {
  display: flex;
  gap: var(--space-xl);
  list-style: none;
  margin: 0;
  padding: 0;
}

.navbar-link {
  color: var(--color-text-primary);
  text-decoration: none;
  font-weight: 500;
  transition: color var(--transition-fast);
}

.navbar-link:hover {
  color: var(--color-accent);
}
```

### 4. Article Card
**Use**: Blog post list items on homepage
**Contents**: Title, excerpt, date, metadata

```css
.article-card {
  padding: var(--space-xl);
  border-bottom: 1px solid var(--color-border);
  transition: background-color var(--transition-base);
}

.article-card:hover {
  background-color: var(--color-bg-secondary);
}

.article-card-title {
  font-size: var(--font-size-xl);
  font-weight: 700;
  margin: 0 0 var(--space-sm) 0;
  line-height: var(--line-height-tight);
}

.article-card-title a {
  color: var(--color-text-primary);
  text-decoration: none;
}

.article-card-title a:hover {
  color: var(--color-accent);
}

.article-card-meta {
  font-size: var(--font-size-sm);
  color: var(--color-text-secondary);
  margin-bottom: var(--space-md);
}

.article-card-excerpt {
  color: var(--color-text-secondary);
  line-height: var(--line-height-relaxed);
}
```

### 5. Alert Component
**Variants**: Success, Warning, Error, Info
**Features**: Dismissible, icon support

```css
.alert {
  padding: var(--space-md) var(--space-lg);
  border-radius: var(--border-radius-md);
  border-left: 4px solid;
  margin-bottom: var(--space-lg);
}

.alert-success {
  background-color: #D1FAE5;
  border-color: var(--color-success);
  color: #065F46;
}

.alert-error {
  background-color: #FEE2E2;
  border-color: var(--color-error);
  color: #991B1B;
}

.alert-warning {
  background-color: #FEF3C7;
  border-color: var(--color-warning);
  color: #92400E;
}
```

### 6. Loading Spinner
```css
.spinner {
  width: 40px;
  height: 40px;
  border: 3px solid var(--color-border);
  border-top-color: var(--color-accent);
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}
```

### 7. Empty State
**Use**: When no content/data to display
**Contents**: Icon, message, optional action

```css
.empty-state {
  text-align: center;
  padding: var(--space-3xl) var(--space-lg);
  color: var(--color-text-secondary);
}

.empty-state-title {
  font-size: var(--font-size-xl);
  font-weight: 600;
  margin-bottom: var(--space-sm);
  color: var(--color-text-primary);
}

.empty-state-message {
  font-size: var(--font-size-base);
  margin-bottom: var(--space-xl);
}
```

### 8. Footer Component
```css
.footer {
  margin-top: var(--space-3xl);
  padding: var(--space-2xl) var(--space-lg);
  border-top: 1px solid var(--color-border);
  text-align: center;
  color: var(--color-text-secondary);
  font-size: var(--font-size-sm);
}
```

## Tasks
1. Create component CSS files in organized structure
2. Implement button component with all variants
3. Create form input components
4. Build navigation bar component
5. Design article card component
6. Implement alert/notification component
7. Create loading spinner animation
8. Build empty state component
9. Create footer component
10. Build badge/tag component
11. Create component documentation/style guide page
12. Test all components for accessibility
13. Test all components for responsiveness
14. Create Rails view partials for each component

## File Structure
```
app/assets/stylesheets/components/
├── _buttons.css
├── _forms.css
├── _navigation.css
├── _cards.css
├── _alerts.css
├── _loading.css
├── _empty-states.css
├── _footer.css
└── _badges.css

app/views/components/
├── _button.html.erb
├── _form_input.html.erb
├── _navbar.html.erb
├── _article_card.html.erb
├── _alert.html.erb
└── _empty_state.html.erb
```

## Testing Checklist
- [ ] All buttons keyboard accessible (Enter/Space triggers)
- [ ] Form inputs have visible focus states
- [ ] Navigation works on mobile (hamburger menu if needed)
- [ ] Article cards look good with varying content lengths
- [ ] Alerts are dismissible and accessible
- [ ] Loading spinner uses CSS animation (no images)
- [ ] Empty states are centered and readable
- [ ] All components tested on mobile (375px) to desktop (1920px)
- [ ] Color contrast meets WCAG AA (4.5:1 minimum)
- [ ] Components work with screen readers

## Dependencies
- Story 0.1: Design System Foundation
- Story 0.2: Typography System

## Related Stories
- Story 2.2: Post CRUD Operations (uses form components)
- Story 2.6: Public Homepage (uses article cards, navbar)
- Story 3.4: Analytics Dashboard (uses various components)

## Accessibility Requirements
- All interactive elements keyboard accessible
- Proper ARIA labels where needed
- Focus states visible and high contrast
- Error messages associated with form fields
- Sufficient color contrast for all text
- No reliance on color alone for information

## Performance Notes
- Keep component CSS modular and tree-shakeable
- Avoid complex animations (60fps requirement)
- Use CSS transforms for animations (GPU acceleration)
- Total component CSS should be < 10KB

## Notes
- Create living style guide page to showcase all components
- Use BEM or similar naming convention for consistency
- Consider creating Stimulus controllers for interactive components
- Test components with real content, not lorem ipsum
