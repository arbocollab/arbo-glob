# Changelog

## v3.0.2 - Sep 2, 2026

### 🆕 New Variables

#### Base Palette
- `--tessr-grey-50`: `#484848FF`
- `--tessr-grey-75`: `#5A5A5AFF`
- `--tessr-timeline-bar-fg-annotation-6`: `#FFFD77FF`
- `--tessr-timeline-bar-fg-annotation-8`: `#9C27B0FF`
- `--tessr-timeline-bar-fg-annotation-10`: `#DC0073FF`

### 🆕 New Tokens

#### Read-only Elements
- `--tessr-bg-read-only`: `var(--tessr-grey-400)`
- `--tessr-form-border-read-only`: `var(--tessr-white)`

#### Card Additions
- `--tessr-card-border-read-only`: `var(--tessr-white)`
- `--tessr-card-border-width-read-only`: `var(--tessr-border-1)`
- `--tessr-card-bg-2-default`: `var(--tessr-grey-500)`
- `--tessr-card-border-2-default`: `var(--tessr-grey-350)`

#### Assignee Badge (Resolved / Unresolved Statuses)
- `--tessr-assignee-fg-disabled`: `var(--tessr-grey-200)`
- `--tessr-assignee-bg-unresolve`: `var(--tessr-status-info-light)`
- `--tessr-assignee-bg-resolved`: `var(--tessr-status-success-light)`
- `--tessr-assignee-fg-resolved`: `var(--tessr-status-success)`

#### Forms (Disabled Foreground States)
- `--tessr-checkbox-fg-disabled`: `var(--tessr-grey-100)`
- `--tessr-radio-fg-disabled`: `var(--tessr-grey-100)`

#### Dark Form Controls
- `--tessr-form-dark-bg-default`: `var(--tessr-grey-50)`
- `--tessr-form-dark-placeholder`: `var(--tessr-grey-300)`
- `--tessr-form-dark-icon`: `var(--tessr-grey-200)`
- `--tessr-form-dark-helper`: `var(--tessr-grey-200)`
- `--tessr-form-dark-border-default`: `var(--tessr-grey-50)`
- `--tessr-form-dark-border-width-default`: `var(--tessr-border-1)`
- `--tessr-form-dark-bg-hover`: `var(--tessr-grey-100)`
- `--tessr-form-dark-bg-focus`: `var(--tessr-grey-100)`
- `--tessr-form-dark-border-focus`: `var(--tessr-primary)`
- `--tessr-form-dark-border-width-focus`: `var(--tessr-border-1-5)`
- `--tessr-form-dark-text-default`: `var(--tessr-white)`
- `--tessr-form-dark-description`: `var(--tessr-grey-400)`
- `--tessr-form-dark-bg-disabled`: `var(--tessr-black)`
- `--tessr-form-dark-text-disabled`: `var(--tessr-grey-50)`
- `--tessr-form-dark-bg-read-only`: `var(--tessr-grey-50)`
- `--tessr-form-dark-border-read-only`: `var(--tessr-grey-50)`

#### Canvas & Toolbar
- `--tessr-bg-canvas`: `var(--tessr-grey-75)`
- `--tessr-toolbar-bg`: `var(--tessr-black)`
- `--tessr-toolbar-border`: `var(--tessr-grey-50)`
- `--tessr-toolbar-button-icon-hover`: `var(--tessr-primary)`
- `--tessr-toolbar-button-icon-default`: `var(--tessr-white)`
- `--tessr-toolbar-button-icon-disabled`: `var(--tessr-grey-100)`

#### Table & Accordion
- `--tessr-table-bg-default`: `var(--tessr-white)`
- `--tessr-table-bg-header-default`: `var(--tessr-grey-400)`
- `--tessr-accordion-bg-default`: `var(--tessr-grey-400)`
- `--tessr-accordion-bg-hover`: `var(--tessr-blue-300)`
- `--tessr-accordion-text-default`: `var(--tessr-black)`
- `--tessr-bar-border-2-default`: `var(--tessr-grey-350)`

#### Timeline Bar & Annotations
- `--tessr-timeline-bar-bg-default`: `var(--tessr-grey-100)`
- `--tessr-timeline-bar-bg-loading`: `var(--tessr-grey-200)`
- `--tessr-timeline-bar-bg-playing`: `var(--tessr-orange-200)`
- `--tessr-timeline-bar-bg-loop`: `var(--tessr-blue-200)`
- `--tessr-timeline-bar-fg-annotation`: `var(--tessr-orange-100)`
- `--tessr-timeline-bar-fg-annotation-2`: `var(--tessr-blue-100)`
- `--tessr-timeline-bar-fg-annotation-3`: `var(--tessr-grey-350)`
- `--tessr-timeline-bar-fg-annotation-4`: `var(--tessr-red-100)`
- `--tessr-timeline-bar-fg-annotation-5`: `var(--tessr-green-200)`
- `--tessr-timeline-bar-fg-annotation-6`: `#FFFD77FF`
- `--tessr-timeline-bar-fg-annotation-7`: `var(--tessr-grey-50)`
- `--tessr-timeline-bar-fg-annotation-8`: `#9C27B0FF`
- `--tessr-timeline-bar-fg-annotation-9`: `var(--tessr-green-100)`
- `--tessr-timeline-bar-fg-annotation-10`: `#DC0073FF`

### 🆕 New Effect Styles

#### Shadows & Focus States
- `.comment-focus`: Added focus shadow `0px 0px 5px 0px rgba(60, 155, 250, 0.2)`
- `.section-shadow`: Added subtle shadow `0px 1px 4px 0px rgba(0, 0, 0, 0.04)`

### 📝 Modified Tokens

#### Tabs
- `--tessr-tab-border-width-focus`: `var(--tessr-border-3)` → `var(--tessr-border-4)`

#### Status / Activity Bar
- `--tessr-bar-bg-default`: `var(--tessr-grey-400)` → `var(--tessr-grey-500)`

#### Progress Bar
- `--tessr-progress-bar-fg`: `var(--tessr-primary)` → `var(--tessr-grey-200)`

#### Color Styles
- `--gradient-loading`: `linear-gradient(180deg, rgba(247, 148, 29, 1) 0%, rgba(243, 245, 248, 1) 100%)` → `linear-gradient(180deg, rgba(215, 215, 215, 1) 0%, rgba(243, 245, 248, 1) 100%)`

### ❌ Removed Tokens

#### Progress Bar Warning Variants
- `--tessr-progress-bar-bg-warning`
- `--tessr-progress-bar-fg-warning`

## v3.0.1 - May 14, 2026

## 🆕 **Design Tokens Update**
## Spacing
- `--tessr-spacing-1-5` (`6px`)

## Component Coverage Expanded

### Status Picker
- `--tessr-status-picker-border`
- `--border-width`

### Refine
- `--tessr-refine-border-default`
- `--border-width-default`

### Forms
- `--tessr-form-bg-read-only`

### Table
- `--tessr-table-bg-hover`

### Badge
- `--tessr-badge-fg-pill`
- `--badge-bg-overflow`
- `--badge-fg-overflow`

### Bar
- `--tessr-bar-placeholder`

### Progress Bar (New Component)
- Background / foreground tokens
- Warning variants

### Typography
- `.font-mono` (`JetBrains Mono`)

### Gradients
Added:
- `--gradient-point`

### Hover States
Hover states shifted from orange → blue

- `--tessr-bar-bg-hover`
- `--tessr-card-bg-hover`

### Gradients
Renamed:
- `--gradient-award` → `--gradient-woohoo`

### Overlay Opacity
Updated opacity:
- `0.08` → `0.2`

Affected components:
- Status picker hover overlays
- Color picker hover overlays

### Avatar
Border width updated:
- `1.5px` → `1px`

Token:
- `--tessr-avatar-border-width-me`


## v3.0.0 - April 9, 2026

### 🎉 Initial Release
First stable release of Tessr design system variables.

### ✨ Features
- Complete set of design tokens including:
  - Typography scale (font sizes: xs, sm, base, lg, xl, 2xl, 4xl, 6xl)
  - Color palette (grey, blue, red, green, orange shades)
  - Spacing system (0-20 with consistent increments)
  - Border radius values (none, xs, sm, md, lg, xl, 2xl, 3xl, full)
  - Border widths (0-10)
  - Avatar colors (8 color options)
- Semantic color aliases for components (buttons, forms, badges, etc.)
- Gradient variables (beta, loading, award)
- Typography classes with Lato font family
- Effect styles (dropdown shadow)

### 🛠️ Tooling
- CSS to Stylus converter script
- SCSS to CSS converter script
- SCSS to Stylus converter script