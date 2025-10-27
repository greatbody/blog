# EPIC-0: UI Design & Style System

## Overview
Establish a modern, light, and professional design system for the personal tech blog. This epic defines the visual language, typography, color palette, and component styles that will create a clean, readable, and engaging user experience optimized for technical content.

## Goals
- Create a clean, minimalist design that prioritizes content readability
- Implement a professional and consistent visual identity
- Ensure excellent typography for code and technical writing
- Maintain fast load times with minimal CSS
- Responsive design that works seamlessly across all devices
- Accessibility-first approach (WCAG 2.1 AA compliance)

## Design Principles
1. **Content First**: Typography and layout designed to make technical articles easy to read
2. **Light & Airy**: Generous whitespace, light background, professional feel
3. **Performance**: Minimal CSS, no heavy frameworks, optimized for speed
4. **Clarity**: Clear visual hierarchy, intuitive navigation
5. **Modern**: Contemporary design patterns without trends that quickly date

## Stories
1. [Story 0.1: Design System Foundation](./story-0.1-design-system.md) - 5 points
2. [Story 0.2: Typography System](./story-0.2-typography.md) - 5 points
3. [Story 0.3: Component Library](./story-0.3-components.md) - 8 points
4. [Story 0.4: Responsive Layout System](./story-0.4-responsive-layout.md) - 5 points
5. [Story 0.5: Code Block Styling](./story-0.5-code-blocks.md) - 5 points

## Total Story Points: 28

## Dependencies
- None (foundational epic to be implemented first)

## Technical Approach
- **CSS Framework**: Minimal custom CSS, modern CSS features (Grid, Flexbox, Custom Properties)
- **No Heavy Dependencies**: Avoid Bootstrap, Tailwind, or similar frameworks
- **Progressive Enhancement**: Works without JavaScript for core content
- **System Fonts**: Use native system font stack for performance
- **Monospace Fonts**: High-quality monospace for code (JetBrains Mono or similar)

## Design Specifications

### Color Palette
**Light Theme (Primary)**
- Background: `#FFFFFF` (pure white)
- Surface: `#F8F9FA` (light gray)
- Text Primary: `#1A1A1A` (near black)
- Text Secondary: `#6B7280` (medium gray)
- Accent: `#3B82F6` (professional blue)
- Accent Hover: `#2563EB` (darker blue)
- Border: `#E5E7EB` (light border)
- Code Background: `#F3F4F6` (light code background)
- Success: `#10B981` (green)
- Warning: `#F59E0B` (amber)
- Error: `#EF4444` (red)

### Typography
**Font Stacks**
- **Body**: `-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif`
- **Headings**: Same as body (system fonts for consistency)
- **Code**: `'JetBrains Mono', 'Fira Code', 'Monaco', 'Consolas', monospace`

**Type Scale**
- H1: 2.5rem (40px) - Article titles
- H2: 2rem (32px) - Major sections
- H3: 1.5rem (24px) - Subsections
- H4: 1.25rem (20px) - Minor headings
- Body: 1.125rem (18px) - Readable for long-form content
- Small: 0.875rem (14px) - Metadata, captions
- Code: 0.95rem (15.2px) - Slightly smaller for density

**Line Heights**
- Headings: 1.2
- Body: 1.7 (generous for readability)
- Code: 1.6

### Spacing System
Based on 8px grid system:
- `xs`: 4px
- `sm`: 8px
- `md`: 16px
- `lg`: 24px
- `xl`: 32px
- `2xl`: 48px
- `3xl`: 64px

### Layout Specifications
- **Max Content Width**: 720px (optimal for reading)
- **Max Wide Width**: 1200px (for dashboard/admin views)
- **Container Padding**: 24px mobile, 48px desktop
- **Vertical Rhythm**: Consistent 24px spacing between elements

### Components to Style
1. Navigation bar (minimal, fixed)
2. Article cards/list items
3. Blog post content area
4. Code blocks with syntax highlighting
5. Buttons (primary, secondary, ghost)
6. Form inputs
7. Links (inline and navigation)
8. Blockquotes
9. Tables
10. Lists (ordered, unordered)
11. Images with captions
12. Footer
13. Loading states
14. Empty states
15. Error states

## Success Criteria
- [ ] Design system documented and implemented
- [ ] All components follow consistent visual language
- [ ] Typography optimized for technical content readability
- [ ] Responsive across mobile (375px) to desktop (1920px)
- [ ] Lighthouse accessibility score ≥ 95
- [ ] CSS bundle < 20KB gzipped
- [ ] No layout shift (CLS score < 0.1)
- [ ] Professional appearance validated by peer review

## Related Epics
- EPIC-2: Content Management (uses components defined here)
- EPIC-3: Analytics (dashboard uses design system)
- EPIC-4: Performance (minimal CSS aligns with performance goals)

## References
- [Web Content Accessibility Guidelines (WCAG) 2.1](https://www.w3.org/WAI/WCAG21/quickref/)
- [Butterick's Practical Typography](https://practicaltypography.com/)
- [The Elements of Typographic Style Applied to the Web](http://webtypography.net/)
