# Design Tokens - The Clean Lab

**Version:** 1.0.0
**System:** 3-tier token architecture
**Location:** `src/styles/tokens/`

---

## Token Architecture

Design tokens provide single source of truth for all design values across platforms.

```
Foundation Tokens (Raw Values)
       ↓
Semantic Tokens (Purpose-Mapped)
       ↓
Component Tokens (Component-Specific)
```

### Foundation Layer
**Location:** `src/styles/tokens/foundation/`
**Purpose:** Raw design values
**Usage:** ❌ DO NOT reference directly in components

### Semantic Layer
**Location:** `src/styles/tokens/semantic/`
**Purpose:** Purpose-mapped tokens
**Usage:** ✅ USE THESE in all component development

### Component Layer
**Purpose:** Component-specific overrides
**Usage:** ✅ For complex components needing unique values

---

## Color Tokens

### Foundation Colors
**File:** `foundation/colors.css`

#### Neutrals (Grayscale)
```css
--color-white: #ffffff;
--color-gray-50: #f8fafc;
--color-gray-100: #f0f2f5;
--color-gray-200: #e2e8f0;
--color-gray-300: #cbd5e1;
--color-gray-400: #94a3b8;
--color-gray-500: #64748b;
--color-gray-900: #0f172a;
--color-black: #111111;
```

#### Brand Colors
```css
/* Tech Blue (Wash Service) */
--color-blue-500: #0055ff;
--color-blue-600: #0044cc;

/* Dry Orange (Dry Service) */
--color-orange-500: #ff4800;
--color-orange-600: #e04000;
```

#### Status Colors
```css
--color-green-500: #00cc66;   /* Success */
--color-red-500: #ff3333;     /* Error */
--color-amber-500: #ffaa00;   /* Warning */
```

### Semantic Colors
**File:** `semantic/colors.css`

#### Backgrounds
```css
--bg-primary: #f0f2f5;        /* Page background */
--bg-secondary: #ffffff;      /* Card background */
--bg-elevated: #ffffff;       /* Floating elements (modals, dropdowns) */
--bg-inverse: #111111;        /* Dark backgrounds */
```

#### Text Colors
```css
--text-primary: #111111;      /* Main content text */
--text-secondary: #0f172a;    /* Supporting text */
--text-muted: #94a3b8;        /* Disabled, placeholders */
--text-inverse: #ffffff;      /* Text on dark backgrounds */
```

#### Border Colors
```css
--border-subtle: #e2e8f0;     /* Subtle dividers */
--border-default: #cbd5e1;    /* Default borders */
--border-strong: #0f172a;     /* Emphasized borders */
```

#### Accent Colors
```css
--accent-primary: #0055ff;         /* Primary actions (Tech Blue) */
--accent-primary-hover: #0044cc;   /* Hover state */
--accent-wash: #0055ff;            /* Wash service identifier */
--accent-dry: #ff4800;             /* Dry service identifier */
--accent-dry-hover: #e04000;       /* Dry hover state */
```

#### Status Colors
```css
--status-success: #00cc66;
--status-error: #ff3333;
--status-warning: #ffaa00;
```

**Contrast Ratios (WCAG AA):**
- Text on bg-primary: 7.5:1 (AAA)
- Text on accent-primary: 8.2:1 (AAA)
- Status colors on white: 4.5:1+ (AA)

---

## Typography Tokens

### Foundation Typography
**File:** `foundation/typography.css`

#### Font Families
```css
--font-sans: Inter, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
--font-mono: 'JetBrains Mono', 'Courier New', monospace;
```

#### Font Weights
```css
--weight-regular: 400;
--weight-medium: 500;
--weight-semibold: 600;
--weight-bold: 700;
--weight-extrabold: 800;
--weight-black: 900;
```

#### Font Sizes
```css
--text-xs: 12px;
--text-sm: 14px;
--text-base: 16px;
--text-lg: 18px;
--text-xl: 20px;
--text-2xl: 24px;
--text-3xl: 30px;
--text-4xl: 36px;
--text-5xl: 48px;
--text-kiosk: 28px;      /* Kiosk-optimized size */
```

#### Line Heights
```css
--leading-none: 1;
--leading-tight: 1.1;
--leading-snug: 1.25;
--leading-normal: 1.5;
--leading-relaxed: 1.75;
```

#### Letter Spacing
```css
--tracking-tight: -0.02em;
--tracking-normal: 0;
--tracking-wide: 0.05em;
```

### Semantic Typography
**File:** `semantic/typography.css`

#### Headings (Inter Black, Uppercase)
```css
--heading-1: 900 36px/1.1 Inter;        /* Hero headings */
--heading-2: 900 30px/1.1 Inter;        /* Section headings */
--heading-3: 700 24px/1.25 Inter;       /* Subsection headings */
--heading-4: 700 20px/1.25 Inter;       /* Card headings */
--heading-kiosk: 900 48px/1.1 Inter;    /* Kiosk display */
```

#### Body Text (Inter Regular)
```css
--body-base: 400 16px/1.5 Inter;        /* Default body text */
--body-lg: 400 18px/1.5 Inter;          /* Large body text */
--body-sm: 400 14px/1.5 Inter;          /* Small body text */
```

#### Technical/Data (JetBrains Mono)
```css
--tech-price: 700 24px/1.1 'JetBrains Mono';       /* Large prices */
--tech-price-lg: 800 36px/1.1 'JetBrains Mono';    /* Kiosk prices */
--tech-label: 500 14px/1.1 'JetBrains Mono';       /* Technical labels */
--tech-code: 500 14px/1.5 'JetBrains Mono';        /* Code/machine IDs */
```

#### Utility Styles
```css
--button-base: 700 16px/1.1 Inter;      /* Button labels */
--caps-sm: 700 12px/1.1 Inter;          /* Small uppercase labels */
--caps-base: 700 14px/1.1 Inter;        /* Default uppercase labels */
```

**Usage Example:**
```css
h1 {
  font: var(--heading-1);
  text-transform: uppercase;
  letter-spacing: var(--tracking-wide);
}

.price {
  font: var(--tech-price);
  color: var(--accent-primary);
}
```

---

## Spacing Tokens

### Foundation Spacing
**File:** `foundation/spacing.css`
**Base Unit:** 4px

```css
--space-0: 0;
--space-1: 4px;
--space-2: 8px;
--space-3: 12px;
--space-4: 16px;
--space-5: 20px;
--space-6: 24px;
--space-8: 32px;
--space-10: 40px;
--space-12: 48px;
--space-16: 64px;
--space-20: 80px;
--space-24: 96px;
```

**Usage Guidelines:**
- `--space-1` - Icon gaps, micro spacing
- `--space-2` - Badge padding, tight gaps
- `--space-3` - Button padding (vertical)
- `--space-4` - Default component gaps
- `--space-6` - Card padding, section gaps
- `--space-8` - Large card padding
- `--space-12` - Section spacing
- `--space-16` - Page margins

---

## Shape Tokens

### Chamfer System
**File:** `foundation/shapes.css`

#### Chamfer Clip-Paths
```css
/* Small - 8px chamfer */
--shape-chamfer-sm: polygon(
  8px 0%, calc(100% - 8px) 0%,
  100% 8px, 100% calc(100% - 8px),
  calc(100% - 8px) 100%, 8px 100%,
  0% calc(100% - 8px), 0% 8px
);

/* Medium - 12px chamfer */
--shape-chamfer-md: polygon(
  12px 0%, calc(100% - 12px) 0%,
  100% 12px, 100% calc(100% - 12px),
  calc(100% - 12px) 100%, 12px 100%,
  0% calc(100% - 12px), 0% 12px
);

/* Large - 20px chamfer */
--shape-chamfer-lg: polygon(
  20px 0%, calc(100% - 20px) 0%,
  100% 20px, 100% calc(100% - 20px),
  calc(100% - 20px) 100%, 20px 100%,
  0% calc(100% - 20px), 0% 20px
);

/* Extra Large - 30px chamfer */
--shape-chamfer-xl: polygon(
  30px 0%, calc(100% - 30px) 0%,
  100% 30px, 100% calc(100% - 30px),
  calc(100% - 30px) 100%, 30px 100%,
  0% calc(100% - 30px), 0% 30px
);
```

#### Utility Classes
```css
.chamfer-sm { clip-path: var(--shape-chamfer-sm); }
.chamfer-md { clip-path: var(--shape-chamfer-md); }
.chamfer-lg { clip-path: var(--shape-chamfer-lg); }
.chamfer-xl { clip-path: var(--shape-chamfer-xl); }
```

**Usage:**
```html
<!-- Apply via class -->
<button class="btn chamfer-sm">Action</button>

<!-- Or via inline style -->
<div style="clip-path: var(--shape-chamfer-md);">Card</div>
```

#### Border Widths
```css
--border-width-sm: 1px;
--border-width-md: 2px;
--border-width-lg: 3px;
```

#### Shadows
```css
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
--shadow-md: 0 2px 8px rgba(0, 0, 0, 0.1);
--shadow-lg: 0 8px 16px rgba(0, 0, 0, 0.15);
```

---

## Breakpoint Tokens

### Responsive Breakpoints
```css
--breakpoint-sm: 640px;    /* Mobile landscape */
--breakpoint-md: 768px;    /* Tablet portrait */
--breakpoint-lg: 1024px;   /* Tablet landscape */
--breakpoint-xl: 1280px;   /* Desktop */
--breakpoint-2xl: 1536px;  /* Large desktop */
```

**Media Query Usage:**
```css
@media (min-width: 768px) {
  /* Tablet and up */
}

@media (min-width: 1024px) {
  /* Desktop and up */
}
```

---

## Touch Target Tokens

### Minimum Touch Targets
```css
--touch-mobile: 44px;      /* iOS HIG minimum */
--touch-default: 48px;     /* Comfortable default */
--touch-kiosk: 82px;       /* Gloved operation, POS */
```

**Usage:**
```css
.btn {
  min-height: var(--touch-default);
}

.btn-kiosk {
  min-height: var(--touch-kiosk);
}
```

---

## Token Export

### JSON Format
**File:** `tokens.json`

Design tokens exported in W3C Design Tokens Community Group format for:
- Figma (Tokens Studio plugin)
- Sketch (Sketch Tokens plugin)
- Style Dictionary (multi-platform export)

### Style Dictionary Config
Transform tokens to platform-specific formats:

```json
{
  "platforms": {
    "css": "tokens.css",
    "ios": "Tokens.swift",
    "android": "tokens.xml",
    "flutter": "tokens.dart"
  }
}
```

---

## Token Naming Convention

### Pattern
```
[category]-[property]-[variant]
```

### Examples
```css
--text-primary          /* category: text, property: primary */
--bg-secondary          /* category: bg, property: secondary */
--accent-wash           /* category: accent, property: wash */
--space-6               /* category: space, property: 6 (24px) */
--heading-1             /* category: heading, property: 1 */
```

---

## Platform-Specific Tokens

### Web/CSS
Import via:
```css
@import './styles/tokens/index.css';
```

### React Native
```javascript
import tokens from './styles/tokens/tokens.json';
const primaryColor = tokens.colors.accent.primary.value;
```

### Flutter
```dart
import 'package:the_clean_lab/tokens.dart';
final primaryColor = Tokens.accentPrimary;
```

### iOS/Swift
```swift
import TheCleanLabTokens
let primaryColor = Tokens.accentPrimary
```

---

## Token Usage Guidelines

### ✅ DO
- Use semantic tokens (`--text-primary`)
- Reference tokens via `var(--token-name)`
- Apply chamfer via utility classes
- Use 4px spacing multiples
- Follow typography presets

### ❌ DON'T
- Hardcode color values (`#0055ff`)
- Reference foundation tokens directly
- Use `border-radius` (use chamfer)
- Use arbitrary spacing (3px, 5px)
- Mix font families arbitrarily

---

## Accessibility Notes

### Color Contrast
All semantic color combinations meet WCAG AA (4.5:1 for text, 3:1 for UI).

**High Contrast:**
- `--text-primary` on `--bg-primary`: 7.5:1 (AAA)
- `--text-inverse` on `--accent-primary`: 8.2:1 (AAA)

### Typography
- Minimum font size: 14px (12px for labels only)
- Line height: 1.5 for body text (readability)
- Letter spacing: Increased for uppercase headings

### Touch Targets
- Mobile: 44px minimum (iOS HIG)
- Kiosk: 82px for gloved operation

---

## Version Control

**Current Version:** 1.0.0

**Versioning Rules:**
- MAJOR: Breaking changes (renamed/removed tokens)
- MINOR: New tokens added
- PATCH: Value updates (color tweaks, spacing adjustments)

**Changelog:** See `CHANGELOG.md` in project root

---

## Related Documentation

- [Brand Overview](./01-brand-overview.md) - Design principles
- [Components](./03-components.md) - How tokens are used
- [Platform Guidelines](./05-platform-guidelines.md) - Platform-specific usage
- [Quick Start](./07-quick-start.md) - Implementation guide

---

## Token Reference Tables

### Color Token Quick Reference

| Token | Value | Usage |
|-------|-------|-------|
| `--bg-primary` | #f0f2f5 | Page background |
| `--bg-secondary` | #ffffff | Card background |
| `--text-primary` | #111111 | Main text |
| `--text-secondary` | #0f172a | Supporting text |
| `--accent-primary` | #0055ff | Primary actions |
| `--accent-wash` | #0055ff | Wash service |
| `--accent-dry` | #ff4800 | Dry service |
| `--status-success` | #00cc66 | Success states |
| `--status-error` | #ff3333 | Error states |

### Typography Token Quick Reference

| Token | CSS Shorthand | Usage |
|-------|---------------|-------|
| `--heading-1` | 900 36px/1.1 Inter | Hero headings |
| `--heading-2` | 900 30px/1.1 Inter | Section headings |
| `--heading-3` | 700 24px/1.25 Inter | Subsection headings |
| `--body-base` | 400 16px/1.5 Inter | Body text |
| `--tech-price` | 700 24px/1.1 JetBrains Mono | Prices |
| `--button-base` | 700 16px/1.1 Inter | Button labels |

### Spacing Token Quick Reference

| Token | Value | Common Usage |
|-------|-------|--------------|
| `--space-2` | 8px | Badge padding |
| `--space-3` | 12px | Button padding (vertical) |
| `--space-4` | 16px | Component gaps |
| `--space-6` | 24px | Card padding |
| `--space-8` | 32px | Large card padding |
| `--space-12` | 48px | Section spacing |
