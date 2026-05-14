# Changelog

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