# Design Tokens - The Clean Lab

**"Titanium Command"** Industrial/Tactical Design System

## Overview

3-tier token architecture providing single source of truth for design values.

```
Foundation → Semantic → Components
(raw values) (purpose-mapped) (component-specific)
```

## Quick Start

```css
/* Import in your main CSS file */
@import './styles/base.css';

/* Or import tokens only */
@import './styles/tokens/index.css';
```

## Token Layers

### Foundation (`foundation/`)

Raw values - **DO NOT use directly** in components.

- **colors.css** - Grayscale, brand colors, status colors
- **typography.css** - Font families, sizes, weights, line heights
- **spacing.css** - 4px base unit scale
- **shapes.css** - Chamfer polygons, shadows, borders

### Semantic (`semantic/`)

Purpose-mapped tokens - **USE THESE** in components.

- **colors.css** - `--bg-primary`, `--text-primary`, `--accent-primary`, etc.
- **typography.css** - `--heading-1`, `--body-base`, `--tech-price`, etc.

## Key Design Rules

### ❌ NO ROUNDED CORNERS

```css
/* NEVER */
border-radius: 8px;

/* ALWAYS - use chamfer clip-paths */
clip-path: var(--shape-chamfer-sm);
/* or utility class */
class="chamfer-sm"
```

### Chamfer Sizes

- **sm (8px)** - Buttons, tags, small cards
- **md (12px)** - Cards, panels
- **lg (20px)** - Hero cards, modals
- **xl (30px)** - Major sections, kiosk screens

### Color Usage

```css
/* Background hierarchy */
--bg-primary: #f0f2f5;      /* Page background */
--bg-secondary: #ffffff;    /* Card background */
--bg-elevated: #ffffff;     /* Floating elements */

/* Text hierarchy */
--text-primary: #111;       /* Main content */
--text-secondary: #0f172a;  /* Supporting text */
--text-muted: #94a3b8;      /* Disabled, placeholders */

/* Service accents */
--accent-wash: #0055ff;     /* Wash/clean service (Tech Blue) */
--accent-dry: #ff4800;      /* Dry service (Dry Orange) */

/* Status colors */
--status-success: #00cc66;
--status-error: #ff3333;
--status-warning: #ffaa00;
```

### Typography Presets

```css
/* Headings - Inter Black, uppercase */
h1 { font: var(--heading-1); }  /* 36px/1.1, 900 weight */
h2 { font: var(--heading-2); }  /* 30px/1.1, 900 weight */
h3 { font: var(--heading-3); }  /* 24px/1.25, 700 weight */

/* Body - Inter Regular */
p { font: var(--body-base); }   /* 16px/1.5, 400 weight */

/* Technical - JetBrains Mono */
.price { font: var(--tech-price); }      /* 24px/1.1, 700 weight */
.tech-label { font: var(--tech-label); } /* 14px/1.1, 500 weight */
```

### Spacing Scale (4px base)

```css
--space-1: 4px;
--space-2: 8px;
--space-3: 12px;
--space-4: 16px;
--space-6: 24px;
--space-8: 32px;
--space-12: 48px;
--space-16: 64px;
```

## Utility Classes

### Chamfer Shapes

```html
<div class="chamfer-sm">Small chamfer (8px)</div>
<div class="chamfer-md">Medium chamfer (12px)</div>
<div class="chamfer-lg">Large chamfer (20px)</div>
<div class="chamfer-xl">Extra-large chamfer (30px)</div>
```

### Tech Grid Background

```html
<div class="tech-grid">20px grid pattern</div>
<div class="tech-grid-fine">10px fine grid</div>
```

### Tactical Effects

```html
<div class="scan-lines">Retro scan-line overlay</div>
<div class="hazard-stripes">Warning stripe pattern</div>
<div class="glow-blue">Tech Blue glow</div>
<div class="glow-orange">Dry Orange glow</div>
```

### Typography

```html
<span class="text-caps">UPPERCASE + WIDE TRACKING</span>
<code class="text-mono">Monospace font</code>
```

## Design Tool Export

`tokens.json` - Design Tokens Format for:
- Figma (Tokens Studio plugin)
- Sketch
- Adobe XD
- Style Dictionary

## Font Loading

Fonts loaded via Google Fonts in `base.css`:

- **Inter** - Weights: 400, 600, 700, 800, 900
- **JetBrains Mono** - Weights: 500, 700, 800

Vietnamese characters fully supported.

## WCAG Compliance

All color combinations pre-validated:

- **Text**: 4.5:1 minimum (AA)
- **UI elements**: 3:1 minimum (AA)

## Browser Support

- Modern browsers (Chrome, Firefox, Safari, Edge)
- Clip-path support: 96%+ (caniuse.com/css-clip-path)
- Fallback strategy: Border-image for legacy browsers

## Examples

### Button with Chamfer

```html
<button class="chamfer-sm" style="
  background: var(--accent-primary);
  color: var(--text-inverse);
  padding: var(--space-3) var(--space-6);
  font: var(--button-base);
">
  ACTIVATE WASH
</button>
```

### Card Component

```html
<div class="chamfer-lg tech-grid" style="
  background: var(--bg-secondary);
  padding: var(--space-6);
  border: var(--border-width-md) solid var(--border-default);
">
  <h3 style="font: var(--heading-3)">DELICATE WASH</h3>
  <p style="font: var(--body-base); color: var(--text-secondary)">
    Gentle cycle for sensitive fabrics
  </p>
  <div style="font: var(--tech-price); color: var(--accent-wash)">
    25.000₫
  </div>
</div>
```

### Price Display

```html
<div style="font: var(--tech-price-lg); color: var(--accent-primary)">
  50.000₫
</div>
```

## Related Files

- `base.css` - CSS reset, font imports, base styles
- `tokens.json` - JSON export for design tools
- `../../docs/design-guidelines.md` - Full design system documentation

## Unresolved Questions

1. Dark mode tokens - separate file or media query?
2. Motion/animation tokens - include now or separate phase?
3. Token export format - Style Dictionary vs Tokens Studio?
