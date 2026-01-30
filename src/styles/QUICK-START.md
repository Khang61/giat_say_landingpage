# Quick Start - The Clean Lab Design Tokens

## Import Tokens

```html
<!-- In your HTML -->
<link rel="stylesheet" href="./styles/base.css">
```

```css
/* Or in your CSS */
@import './styles/base.css';
```

## Basic Usage Examples

### Chamfered Button

```html
<button class="chamfer-sm" style="
  background: var(--accent-primary);
  color: var(--text-inverse);
  padding: var(--space-3) var(--space-6);
  font: var(--button-base);
  text-transform: uppercase;
  border: var(--border-width-md) solid var(--accent-primary);
">
  ACTIVATE WASH
</button>
```

### Service Card

```html
<div class="chamfer-lg tech-grid" style="
  background: var(--bg-secondary);
  padding: var(--space-6);
  border: var(--border-width-md) solid var(--border-default);
">
  <h3>DELICATE WASH</h3>
  <p style="color: var(--text-secondary);">
    Gentle cycle for sensitive fabrics
  </p>
  <div style="font: var(--tech-price); color: var(--accent-wash);">
    25.000₫
  </div>
</div>
```

### Price Display

```html
<div style="
  font: var(--tech-price-lg);
  color: var(--accent-primary);
">
  50.000₫
</div>
```

### Status Badge

```html
<span class="chamfer-sm" style="
  display: inline-block;
  padding: var(--space-2) var(--space-4);
  background: var(--status-success);
  color: var(--text-inverse);
  font: var(--caps-sm);
  text-transform: uppercase;
">
  AVAILABLE
</span>
```

## Key Rules

1. **NO rounded corners** - Use `.chamfer-*` classes only
2. **Use semantic tokens** - `var(--text-primary)` not `var(--color-black)`
3. **4px spacing** - Use `var(--space-*)` tokens
4. **Service colors** - Blue for wash, Orange for dry

## Token Categories

| Category | Token Pattern | Example |
|----------|---------------|---------|
| Background | `--bg-*` | `var(--bg-primary)` |
| Text | `--text-*` | `var(--text-primary)` |
| Accent | `--accent-*` | `var(--accent-wash)` |
| Status | `--status-*` | `var(--status-success)` |
| Spacing | `--space-*` | `var(--space-6)` |
| Typography | `--heading-*`, `--body-*`, `--tech-*` | `var(--heading-1)` |

## Demo

Open `src/token-demo.html` in browser to see all tokens in action.

## Full Documentation

See `src/styles/tokens/README.md` for complete token reference.
