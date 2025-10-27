# Story 0.4: Responsive Layout System

## Story
**As a** user  
**I want** the blog to work beautifully on any device  
**So that** I can read comfortably whether on mobile, tablet, or desktop

## Priority: P0 (Must Have)
## Story Points: 5

---

## Description
Implement a mobile-first responsive layout system that ensures the blog works seamlessly across all screen sizes. Use CSS Grid and Flexbox for modern, flexible layouts without heavy framework dependencies.

## Acceptance Criteria
- [ ] Mobile-first responsive design approach
- [ ] Breakpoints defined for key device sizes
- [ ] Content readable on smallest devices (320px width)
- [ ] Navigation adapts on mobile (hamburger menu or simplified)
- [ ] Images responsive (scale appropriately, lazy load)
- [ ] Touch targets minimum 44x44px on mobile
- [ ] No horizontal scrolling on any device
- [ ] Tables responsive (scroll or stack on mobile)
- [ ] Layout tested on real devices
- [ ] Viewport meta tag configured correctly

## Breakpoint System
```css
/* Mobile First Approach */
/* Base: 320px - 767px (mobile) */

/* Tablet: 768px+ */
@media (min-width: 768px) {
  /* Tablet styles */
}

/* Desktop: 1024px+ */
@media (min-width: 1024px) {
  /* Desktop styles */
}

/* Large Desktop: 1280px+ */
@media (min-width: 1280px) {
  /* Large desktop styles */
}
```

## CSS Custom Properties for Breakpoints
```css
:root {
  --breakpoint-sm: 640px;
  --breakpoint-md: 768px;
  --breakpoint-lg: 1024px;
  --breakpoint-xl: 1280px;
}
```

## Layout Patterns

### 1. Container System
```css
.container {
  width: 100%;
  max-width: var(--max-width-wide);
  margin: 0 auto;
  padding: 0 var(--space-md);
}

@media (min-width: 768px) {
  .container {
    padding: 0 var(--space-lg);
  }
}

@media (min-width: 1024px) {
  .container {
    padding: 0 var(--space-2xl);
  }
}

.container-narrow {
  max-width: var(--max-width-content);
}
```

### 2. Grid System (CSS Grid)
```css
.grid {
  display: grid;
  gap: var(--space-lg);
}

.grid-cols-1 {
  grid-template-columns: 1fr;
}

@media (min-width: 768px) {
  .grid-cols-2-md {
    grid-template-columns: repeat(2, 1fr);
  }
  
  .grid-cols-3-md {
    grid-template-columns: repeat(3, 1fr);
  }
}

@media (min-width: 1024px) {
  .grid-cols-4-lg {
    grid-template-columns: repeat(4, 1fr);
  }
}
```

### 3. Flexible Stack
```css
.stack {
  display: flex;
  flex-direction: column;
  gap: var(--space-md);
}

.stack-lg {
  gap: var(--space-xl);
}

@media (min-width: 768px) {
  .stack-md-row {
    flex-direction: row;
  }
}
```

### 4. Responsive Navigation
```css
/* Mobile navigation */
.navbar-nav {
  display: none; /* Hidden by default on mobile */
}

.navbar-toggle {
  display: block;
  background: none;
  border: none;
  font-size: 1.5rem;
  cursor: pointer;
}

@media (min-width: 768px) {
  .navbar-nav {
    display: flex;
  }
  
  .navbar-toggle {
    display: none;
  }
}

/* Mobile menu open state */
.navbar-nav.is-open {
  display: flex;
  flex-direction: column;
  position: absolute;
  top: 64px;
  left: 0;
  right: 0;
  background: white;
  padding: var(--space-lg);
  border-bottom: 1px solid var(--color-border);
}
```

### 5. Responsive Images
```css
img {
  max-width: 100%;
  height: auto;
  display: block;
}

picture {
  display: block;
}

/* Aspect ratio boxes for images */
.aspect-ratio-box {
  position: relative;
  width: 100%;
  padding-bottom: 56.25%; /* 16:9 */
  overflow: hidden;
}

.aspect-ratio-box img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}
```

### 6. Responsive Tables
```css
.table-wrapper {
  overflow-x: auto;
  -webkit-overflow-scrolling: touch;
}

table {
  width: 100%;
  border-collapse: collapse;
  font-size: var(--font-size-sm);
}

@media (min-width: 768px) {
  table {
    font-size: var(--font-size-base);
  }
}

/* Alternative: Stack table on mobile */
@media (max-width: 767px) {
  .table-responsive thead {
    display: none;
  }
  
  .table-responsive tr {
    display: block;
    margin-bottom: var(--space-lg);
    border: 1px solid var(--color-border);
  }
  
  .table-responsive td {
    display: block;
    text-align: right;
    padding: var(--space-sm);
    border-bottom: 1px solid var(--color-border);
  }
  
  .table-responsive td::before {
    content: attr(data-label);
    float: left;
    font-weight: 600;
  }
}
```

## Viewport Configuration
```html
<!-- Add to application.html.erb head -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

## Typography Scaling
```css
/* Mobile */
:root {
  --font-size-3xl: 2rem;    /* H1: 32px on mobile */
  --font-size-2xl: 1.5rem;  /* H2: 24px on mobile */
  --font-size-xl: 1.25rem;  /* H3: 20px on mobile */
}

/* Desktop */
@media (min-width: 768px) {
  :root {
    --font-size-3xl: 2.5rem;  /* H1: 40px on desktop */
    --font-size-2xl: 2rem;    /* H2: 32px on desktop */
    --font-size-xl: 1.5rem;   /* H3: 24px on desktop */
  }
}
```

## Touch Target Sizing
```css
/* Ensure minimum 44x44px touch targets on mobile */
.btn,
.navbar-link,
a.card {
  min-height: 44px;
  min-width: 44px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

@media (min-width: 768px) {
  /* Can be smaller on desktop with mouse */
  .btn,
  .navbar-link {
    min-height: auto;
    min-width: auto;
  }
}
```

## Layout Spacing Adjustments
```css
/* Tighter spacing on mobile */
.section {
  padding: var(--space-xl) 0;
}

@media (min-width: 768px) {
  .section {
    padding: var(--space-3xl) 0;
  }
}
```

## Tasks
1. Define breakpoint system and CSS custom properties
2. Implement container system (fluid and fixed-width)
3. Create CSS Grid utility classes
4. Build flexible stack/flex utilities
5. Implement responsive navigation (mobile menu)
6. Make images responsive (max-width, height auto)
7. Create responsive table patterns
8. Add viewport meta tag to application layout
9. Implement typography scaling across breakpoints
10. Ensure touch targets meet minimum size (44x44px)
11. Test on physical devices (iPhone, iPad, Android)
12. Test with Chrome DevTools device emulation
13. Verify no horizontal scroll at any breakpoint

## Testing Checklist

### Device Testing
- [ ] iPhone SE (375px) - smallest mobile
- [ ] iPhone 12/13/14 (390px)
- [ ] iPhone Pro Max (428px)
- [ ] iPad (768px) - tablet portrait
- [ ] iPad Pro (1024px) - tablet landscape
- [ ] Desktop (1280px, 1440px, 1920px)

### Feature Testing
- [ ] Navigation works on mobile (toggle menu)
- [ ] All content readable without zooming
- [ ] No horizontal scrolling at any size
- [ ] Images scale proportionally
- [ ] Tables scroll or stack appropriately
- [ ] Forms usable on mobile (proper input sizes)
- [ ] Touch targets large enough (44x44px minimum)
- [ ] Text doesn't overflow containers
- [ ] Spacing feels consistent across sizes

### Performance Testing
- [ ] No layout shift (CLS < 0.1)
- [ ] Fast rendering on mobile devices
- [ ] Smooth scrolling on touch devices

## Dependencies
- Story 0.1: Design System Foundation
- Story 0.3: Component Library

## Related Stories
- Story 0.3: Component Library (components must be responsive)
- Story 2.6: Public Homepage (uses responsive layout)
- Story 4.2: Asset Optimization (responsive images)

## Accessibility Considerations
- Touch targets minimum 44x44px (WCAG 2.5.5)
- No loss of functionality at any viewport size
- Zoom works properly up to 200%
- Content reflows without horizontal scrolling
- Focus indicators visible on all screen sizes

## Performance Notes
- Mobile-first CSS (smaller initial bundle)
- Use CSS Grid/Flexbox over frameworks
- Lazy load images below the fold
- Use responsive images (srcset, sizes)
- Test on real devices with network throttling

## Best Practices
- Design mobile experience first, enhance for desktop
- Test on real devices, not just emulators
- Use relative units (rem, em) over pixels where appropriate
- Avoid fixed heights (let content determine height)
- Use fluid typography (clamp() for smooth scaling)

## Notes
- Hamburger menu may need JavaScript (use Stimulus)
- Consider progressive enhancement (works without JS)
- Test with actual content, not placeholder text
- Monitor for layout shift with Chrome DevTools
