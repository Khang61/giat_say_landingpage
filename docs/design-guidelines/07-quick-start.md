# Quick Start Guide - The Clean Lab

**Version:** 1.0.0
**Time to First Component:** ~10 minutes

---

## Installation

### Option 1: Direct CSS Import (Web)

```html
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>The Clean Lab</title>

  <!-- Import Complete Design System -->
  <link rel="stylesheet" href="./src/styles/index.css">
</head>
<body>
  <!-- Your app here -->
</body>
</html>
```

### Option 2: Modular Import

```css
/* In your main CSS file */
@import './src/styles/tokens/index.css';      /* Design tokens */
@import './src/styles/components/index.css';  /* Components */
@import './src/styles/platforms/web.css';     /* Platform-specific */
@import './src/styles/animations/index.css';  /* Animations */
```

### Option 3: React/Next.js

```javascript
// In _app.js or layout component
import '../src/styles/index.css';

function MyApp({ Component, pageProps }) {
  return <Component {...pageProps} />;
}
```

### Option 4: React Native

```javascript
// Import token JSON
import tokens from './src/styles/tokens/tokens.json';

// Use in StyleSheet
const styles = StyleSheet.create({
  button: {
    backgroundColor: tokens.colors.accent.primary.value,
    paddingHorizontal: tokens.spacing['6'].value,
  },
});
```

---

## File Structure

```
src/styles/
├── index.css                # Main entry point (import this)
├── base.css                 # Reset + base styles
├── tokens/
│   ├── index.css           # All tokens
│   ├── foundation/         # Raw values
│   │   ├── colors.css
│   │   ├── typography.css
│   │   ├── spacing.css
│   │   └── shapes.css
│   ├── semantic/           # Purpose-mapped
│   │   ├── colors.css
│   │   └── typography.css
│   └── tokens.json         # Design tool export
├── components/
│   ├── index.css           # All components
│   ├── buttons.css
│   ├── cards.css
│   ├── forms.css
│   ├── header.css
│   └── status.css
├── platforms/
│   ├── index.css
│   ├── web.css
│   └── kiosk.css
└── animations/
    ├── index.css
    ├── motion-tokens.css
    ├── buttons.css
    └── devices.css
```

---

## Your First Component

### Example 1: Primary Button

```html
<button class="btn btn-primary">
  Start Wash
</button>
```

**Result:** Blue button with chamfered corners, uppercase text, 48px height

### Example 2: Service Card

```html
<div class="card card-selectable card-accent-wash">
  <h3>Standard Wash</h3>
  <p>Regular cycle for everyday clothes</p>
  <div class="card-service-price">20.000₫</div>
  <button class="btn btn-wash btn-sm">Select</button>
</div>
```

**Result:** Selectable card with blue accent strip, price in monospace

### Example 3: Input Field

```html
<div class="form-group">
  <label for="phone" class="form-label">Phone Number</label>
  <input
    type="tel"
    id="phone"
    class="input"
    placeholder="0912 345 678"
    required
  >
</div>
```

**Result:** Chamfered input with focus ring, validation states

---

## Core Concepts

### 1. Chamfered Corners (NOT Rounded)

```html
<!-- ❌ NEVER do this -->
<div style="border-radius: 8px;">Wrong</div>

<!-- ✅ ALWAYS do this -->
<div class="chamfer-sm">Correct</div>
<div style="clip-path: var(--shape-chamfer-sm);">Also correct</div>
```

### 2. Semantic Tokens

```css
/* ❌ Don't use foundation tokens directly */
.my-button {
  background: var(--color-blue-500); /* Raw value */
}

/* ✅ Use semantic tokens */
.my-button {
  background: var(--accent-primary); /* Purpose-mapped */
  color: var(--text-inverse);
  padding: var(--space-3) var(--space-6);
}
```

### 3. Service Color Coding

```html
<!-- Wash service = Tech Blue -->
<button class="btn btn-wash">Select Wash</button>
<div class="card card-accent-wash">Wash service card</div>

<!-- Dry service = Dry Orange -->
<button class="btn btn-dry">Select Dry</button>
<div class="card card-accent-dry">Dry service card</div>
```

### 4. Typography Hierarchy

```html
<!-- Headings: Inter Black, uppercase -->
<h1 style="font: var(--heading-1);">HERO HEADING</h1>
<h2 style="font: var(--heading-2);">SECTION HEADING</h2>

<!-- Body: Inter Regular -->
<p style="font: var(--body-base);">Body text here...</p>

<!-- Prices: JetBrains Mono Bold -->
<div style="font: var(--tech-price);">25.000₫</div>
```

---

## Common Patterns

### Pattern 1: Machine Selection Grid

```html
<div class="card-grid card-grid-3">
  <div class="card card-selectable card-accent-wash">
    <div class="machine-number">
      <span style="font: var(--tech-price-lg);">03</span>
    </div>
    <h3>WASH-03</h3>
    <span class="status status-success">Available</span>
    <button class="btn btn-wash btn-sm">Select</button>
  </div>

  <div class="card card-selectable card-accent-wash">
    <div class="machine-number">
      <span style="font: var(--tech-price-lg);">05</span>
    </div>
    <h3>WASH-05</h3>
    <span class="status status-warning">In Use</span>
    <div class="progress-bar">
      <div class="progress-bar-fill" style="width: 60%;"></div>
    </div>
    <p>25 min remaining</p>
  </div>
</div>
```

### Pattern 2: Payment Method Selection

```html
<div class="card-grid-3">
  <div class="card card-selectable card-kiosk">
    <svg class="icon icon-xl"><!-- QR icon --></svg>
    <h3>QR CODE</h3>
    <p>Scan with banking app</p>
  </div>

  <div class="card card-selectable card-kiosk">
    <svg class="icon icon-xl"><!-- Card icon --></svg>
    <h3>CREDIT CARD</h3>
    <p>Insert card below</p>
  </div>

  <div class="card card-selectable card-kiosk">
    <svg class="icon icon-xl"><!-- Cash icon --></svg>
    <h3>CASH</h3>
    <p>Bills accepted</p>
  </div>
</div>
```

### Pattern 3: Form with Validation

```html
<form>
  <div class="form-group">
    <label for="email" class="form-label">Email</label>
    <input
      type="email"
      id="email"
      class="input"
      placeholder="you@example.com"
      required
    >
  </div>

  <div class="form-group form-group-error">
    <label for="phone" class="form-label">Phone</label>
    <input
      type="tel"
      id="phone"
      class="input input-error"
      aria-invalid="true"
    >
    <span class="form-error">Phone number is required</span>
  </div>

  <button type="submit" class="btn btn-primary btn-block">
    Submit
  </button>
</form>
```

---

## Responsive Design

### Breakpoint Usage

```css
/* Mobile-first approach */
.container {
  padding: var(--space-4);
}

@media (min-width: 768px) {
  /* Tablet */
  .container {
    padding: var(--space-6);
  }
}

@media (min-width: 1024px) {
  /* Desktop */
  .container {
    padding: var(--space-8);
    max-width: 1280px;
    margin: 0 auto;
  }
}
```

### Responsive Grid

```html
<!-- Automatically responsive -->
<div class="card-grid">
  <div class="card">Card 1</div>
  <div class="card">Card 2</div>
  <div class="card">Card 3</div>
</div>

<!-- Mobile: 1 column, Tablet: 2 columns, Desktop: 3+ columns -->
```

---

## Platform-Specific Implementations

### Web Platform

```html
<html class="platform-web">
  <body>
    <!-- Standard web buttons (48px) -->
    <button class="btn btn-primary">Action</button>
  </body>
</html>
```

### Kiosk Platform

```html
<html class="platform-kiosk">
  <body>
    <div class="kiosk-layout">
      <header class="kiosk-header">...</header>
      <main class="kiosk-content">
        <!-- Large kiosk buttons (82px) -->
        <button class="btn-kiosk btn-kiosk-primary">Action</button>
      </main>
      <footer class="kiosk-hardware-zone">...</footer>
    </div>
  </body>
</html>
```

---

## Debugging Checklist

### Component Not Styled?

1. **Check import order:**
   ```html
   <link rel="stylesheet" href="./src/styles/index.css">
   ```

2. **Verify class name:**
   ```html
   <button class="btn btn-primary"><!-- Correct --></button>
   <button class="button primary"><!-- Wrong --></button>
   ```

3. **Check CSS specificity:**
   ```css
   /* Design system styles */
   .btn { background: blue; }

   /* Your override (too specific) */
   div button.btn { background: red; } /* Avoid */
   ```

### Chamfered Corners Not Working?

1. **Check browser support:**
   - `clip-path` requires modern browsers (96%+ support)
   - Fallback: Use border-image for legacy browsers

2. **Check element rendering:**
   ```css
   /* Clip-path requires element to be rendered */
   .chamfer-sm {
     display: block; /* or inline-block, flex, grid */
     clip-path: var(--shape-chamfer-sm);
   }
   ```

### Fonts Not Loading?

1. **Check network tab:**
   - Verify font files are loading (200 status)
   - Check CORS headers for external fonts

2. **Add font-display:**
   ```css
   @font-face {
     font-family: 'Inter';
     font-display: swap; /* Prevent FOIT */
     src: url('/fonts/inter.woff2') format('woff2');
   }
   ```

---

## Next Steps

### 1. Explore Components
Read [Components](./03-components.md) for complete component library

### 2. Learn Patterns
Review [Patterns](./04-patterns.md) for common UI flows

### 3. Understand Tokens
Study [Design Tokens](./02-design-tokens.md) for token system

### 4. Platform Adaptation
Check [Platform Guidelines](./05-platform-guidelines.md) for your target platform

### 5. Add Motion
Review [Animation](./06-animation.md) for motion system

---

## Frequently Asked Questions

### Can I use rounded corners instead of chamfers?
**No.** Chamfered corners are non-negotiable for brand consistency. Use `.chamfer-*` classes or `clip-path` properties.

### How do I change the brand color?
Update semantic tokens in `tokens/semantic/colors.css`:
```css
--accent-primary: #FF0000; /* Your new color */
```

### Can I mix wash and dry colors?
**No.** Service colors are semantic:
- Blue = Wash/Clean operations
- Orange = Dry/Heat operations

### What's the minimum touch target?
- **Web/Mobile:** 44-48px
- **Kiosk:** 82px

### How do I add dark mode?
```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg-primary: #111111;
    --bg-secondary: #1a1a1a;
    --text-primary: #ffffff;
    /* ... update all semantic tokens */
  }
}
```

---

## Support & Resources

### Documentation
- [Brand Overview](./01-brand-overview.md) - Design principles
- [Design Tokens](./02-design-tokens.md) - Token reference
- [Components](./03-components.md) - Component library
- [Patterns](./04-patterns.md) - UI patterns
- [Platform Guidelines](./05-platform-guidelines.md) - Platform specifics
- [Animation](./06-animation.md) - Motion system

### Code Files
- `src/styles/` - All source files
- `src/styles/tokens/tokens.json` - Design tool export
- `src/token-demo.html` - Live token demo

### Questions?
- Review full documentation in `docs/design-guidelines/`
- Check component CSS files for implementation details
- File issues for bugs or feature requests
