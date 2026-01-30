# Component Library - The Clean Lab

**Version:** 1.0.0
**System:** "Titanium Command" Component System
**Location:** `src/styles/components/`

---

## Component Principles

All components follow these core rules:
1. **Chamfered corners only** - No border-radius
2. **Semantic token usage** - Reference semantic layer
3. **Accessible by default** - ARIA attributes, focus states
4. **Touch-optimized** - 48px minimum (82px kiosk)
5. **Service-colored** - Blue=wash, Orange=dry

---

## Button Component

**File:** `components/buttons.css`
**Primary action element for user interactions**

### Variants

#### Primary Button (Default)
**Usage:** Main CTAs, form submissions, primary actions

```html
<button class="btn btn-primary">Start Wash</button>
```

**Tokens:**
- Background: `--accent-primary`
- Text: `--text-inverse`
- Border: `--color-black` 2px
- Chamfer: `--shape-chamfer-sm` (8px)

#### Secondary Button
**Usage:** Alternative actions, less emphasized

```html
<button class="btn btn-secondary">View Details</button>
```

**Tokens:**
- Background: `--bg-secondary`
- Text: `--text-primary`
- Border: `--border-strong` 2px

#### Ghost Button
**Usage:** Tertiary actions, navigation, cancel

```html
<button class="btn btn-ghost">Cancel</button>
```

**Tokens:**
- Background: `transparent`
- Text: `--text-primary`
- Border: `transparent`
- Hover: `--bg-gray-100`

### Sizes

| Size | Min Height | Padding | Use Case |
|------|-----------|---------|----------|
| `btn-sm` | 36px | 8px 16px | Dense UIs, inline actions |
| `btn` (default) | 48px | 12px 24px | Most common use |
| `btn-lg` | 56px | 16px 32px | Emphasized actions |
| `btn-kiosk` | 82px | 20px 40px | Kiosk/POS touchscreen |

```html
<button class="btn btn-sm">Small</button>
<button class="btn">Default</button>
<button class="btn btn-lg">Large</button>
<button class="btn btn-kiosk">Kiosk</button>
```

### States

#### Default
Ready for interaction

#### Hover (Web)
```css
background: var(--accent-primary-hover);
```

#### Active (Pressed)
```css
transform: scale(0.96);
```

#### Disabled
```html
<button class="btn" disabled>Disabled</button>
```
- Opacity: 0.6
- Cursor: `not-allowed`
- No pointer events

#### Loading
```html
<button class="btn" aria-busy="true">Loading...</button>
```
Shows spinner animation automatically

### Service Variants

#### Wash Button (Tech Blue)
```html
<button class="btn btn-wash">Select Wash</button>
```

#### Dry Button (Dry Orange)
```html
<button class="btn btn-dry">Select Dry</button>
```

### Icon Buttons

```html
<!-- Icon only -->
<button class="btn btn-icon">
  <svg>...</svg>
</button>

<!-- Icon + label -->
<button class="btn">
  <svg>...</svg>
  <span>Action</span>
</button>
```

### Anatomy

```
┌─────────────────────────┐
│   [Icon] BUTTON LABEL   │ ← 48px min height
└─────────────────────────┘
  ↑        ↑         ↑
  8px    12px/24px  8px chamfer corners
  padding  gap    (not rounded)
```

### Do/Don't

#### ✅ DO
- Use ONE primary button per screen
- Include loading state for async actions
- Uppercase text for labels
- 44px minimum touch target (mobile)
- 82px minimum for kiosk

#### ❌ DON'T
- Stack multiple primary buttons
- Skip disabled states
- Use rounded corners
- Mix service colors (wash button with dry color)

---

## Card Component

**File:** `components/cards.css`
**Container for grouped content**

### Base Card

```html
<div class="card">
  <h3>Card Title</h3>
  <p>Card content here...</p>
</div>
```

**Tokens:**
- Background: `--bg-secondary`
- Border: `--border-default` 2px
- Chamfer: `--shape-chamfer-lg` (20px)
- Padding: `--space-6` (24px)
- Shadow: `--shadow-sm`

### Card Sizes

```html
<div class="card card-sm">Small card (16px padding, 8px chamfer)</div>
<div class="card">Default card (24px padding, 20px chamfer)</div>
<div class="card card-lg">Large card (32px padding, 30px chamfer)</div>
```

### Selectable Card

**Usage:** Machine selection, service options

```html
<div class="card card-selectable" role="button" aria-selected="false">
  <h3>Delicate Wash</h3>
  <p>Gentle cycle for sensitive fabrics</p>
</div>
```

**Selected State:**
```html
<div class="card card-selectable" aria-selected="true">
  <!-- Content -->
</div>
```

**Tokens (selected):**
- Background: `--bg-inverse` (black)
- Text: `--text-inverse` (white)
- Border: `--accent-primary`
- Left accent strip: 4px `--accent-primary`

### Accent Strip Variants

Visual service/status indicators on left edge

```html
<!-- Wash service card -->
<div class="card card-accent-wash">...</div>

<!-- Dry service card -->
<div class="card card-accent-dry">...</div>

<!-- Status cards -->
<div class="card card-accent-success">...</div>
<div class="card card-accent-error">...</div>
<div class="card card-accent-warning">...</div>
```

### Card Anatomy

```html
<div class="card">
  <div class="card-header">
    <h3 class="card-title">Title</h3>
    <span class="card-subtitle">Subtitle</span>
  </div>

  <div class="card-body">
    <p>Main content...</p>
  </div>

  <div class="card-footer">
    <span>Footer info</span>
    <div class="card-footer-actions">
      <button class="btn btn-sm">Action</button>
    </div>
  </div>
</div>
```

### Card Grid Layout

```html
<div class="card-grid">
  <div class="card">Card 1</div>
  <div class="card">Card 2</div>
  <div class="card">Card 3</div>
</div>
```

**Grid Variants:**
- `card-grid` - Auto-fill, 280px min columns
- `card-grid-2` - Auto-fill, 320px min columns
- `card-grid-3` - Auto-fill, 240px min columns

### Service Card

**Usage:** Service/program selection

```html
<div class="card card-service card-selectable">
  <div class="card-service-icon">
    <svg>...</svg>
  </div>
  <h3 class="card-service-title">Delicate Wash</h3>
  <div class="card-service-price">25.000₫</div>
  <button class="btn btn-sm">Select</button>
</div>
```

### Do/Don't

#### ✅ DO
- Use accent strips for service/status
- Include hover states for interactive cards
- Maintain 20px chamfer (default)
- Group related content
- Use card-grid for responsive layouts

#### ❌ DON'T
- Mix accent strip colors arbitrarily
- Nest cards deeply (max 1 level)
- Override chamfer with border-radius
- Forget selected state styling
- Use for single-line content (use badge)

---

## Form Components

**File:** `components/forms.css`
**Data input elements**

### Text Input

```html
<label for="name" class="form-label">Name</label>
<input type="text" id="name" class="input" placeholder="Enter name">
```

**Tokens:**
- Background: `--bg-secondary`
- Border: `--border-default` 2px
- Chamfer: `--shape-chamfer-sm` (8px)
- Min height: 48px
- Font: `--body-base`

**States:**
```html
<!-- Default -->
<input type="text" class="input">

<!-- Focus -->
<input type="text" class="input"> <!-- Blue focus ring -->

<!-- Error -->
<input type="text" class="input input-error" aria-invalid="true">

<!-- Disabled -->
<input type="text" class="input" disabled>
```

### Input Sizes

```html
<input type="text" class="input input-sm">  <!-- 36px height -->
<input type="text" class="input">           <!-- 48px height -->
<input type="text" class="input input-lg">  <!-- 56px height -->
```

### Textarea

```html
<textarea class="textarea" rows="4" placeholder="Enter text..."></textarea>
```

**Tokens:**
- Min height: 120px
- Resize: `vertical` only
- Same styling as input

### Select Dropdown

```html
<select class="select">
  <option>Option 1</option>
  <option>Option 2</option>
  <option>Option 3</option>
</select>
```

### Checkbox

```html
<label class="checkbox">
  <input type="checkbox" class="checkbox-input">
  <span class="checkbox-label">Accept terms</span>
</label>
```

**Custom styling:**
- Chamfered checkbox indicator
- Tech Blue checked state
- 20px×20px size (mobile)
- 24px×24px size (kiosk)

### Radio Button

```html
<label class="radio">
  <input type="radio" name="payment" class="radio-input">
  <span class="radio-label">QR Code</span>
</label>
```

**Styling:**
- Chamfered (not circular)
- Same sizing as checkbox

### Form Group

```html
<div class="form-group">
  <label for="email" class="form-label">Email</label>
  <input type="email" id="email" class="input">
  <span class="form-hint">We'll never share your email</span>
</div>

<!-- With error -->
<div class="form-group form-group-error">
  <label for="phone" class="form-label">Phone</label>
  <input type="tel" id="phone" class="input input-error" aria-invalid="true">
  <span class="form-error">Phone number is required</span>
</div>
```

### Do/Don't

#### ✅ DO
- Include visible labels
- Show focus states clearly
- Use placeholder for examples only
- Provide error messages inline
- Match input size to context

#### ❌ DON'T
- Hide labels (accessibility)
- Use placeholder as label
- Round checkbox/radio corners
- Omit error states
- Forget disabled styling

---

## Header Component

**File:** `components/header.css`
**Page/screen header with navigation**

### Basic Header

```html
<header class="header">
  <div class="header-container">
    <div class="header-logo">
      <h1>THE CLEAN LAB</h1>
    </div>
    <nav class="header-nav">
      <a href="#" class="header-nav-link">Services</a>
      <a href="#" class="header-nav-link">Pricing</a>
      <button class="btn btn-sm btn-primary">Login</button>
    </nav>
  </div>
</header>
```

**Tokens:**
- Background: `--bg-secondary`
- Border-bottom: `--border-default` 2px
- Height: 64px (web), 80px (kiosk)
- Padding: `--space-4`

### Header with Back Button

```html
<header class="header header-simple">
  <button class="btn btn-ghost btn-icon">
    <svg><!-- Back arrow --></svg>
  </button>
  <h2>Machine Selection</h2>
  <div></div> <!-- Spacer for centering -->
</header>
```

### Do/Don't

#### ✅ DO
- Keep navigation flat (max 1 level)
- Include back button for sub-screens
- Use consistent height
- Sticky header for long pages

#### ❌ DON'T
- Nest multiple navigation levels
- Hide critical actions in hamburger (kiosk)
- Use gradient backgrounds

---

## Status Indicators

**File:** `components/status.css`
**Visual feedback for states**

### Status Badge

```html
<span class="status status-success">Available</span>
<span class="status status-error">Unavailable</span>
<span class="status status-warning">In Use</span>
```

**Tokens:**
- Background: `--status-*` colors
- Text: `--text-inverse`
- Padding: `--space-2 --space-4`
- Chamfer: `--shape-chamfer-sm`
- Font: `--caps-sm` (uppercase)

### Status Dot

```html
<span class="status-dot status-dot-success"></span> Available
<span class="status-dot status-dot-error"></span> Offline
<span class="status-dot status-dot-warning"></span> Busy
```

**Size:** 8px×8px chamfered square

### Progress Bar

```html
<div class="progress-bar">
  <div class="progress-bar-fill" style="width: 60%;"></div>
</div>
```

**Tokens:**
- Background: `--color-gray-200`
- Fill: `--accent-primary`
- Height: 8px (default), 16px (kiosk)
- Chamfer: `--shape-chamfer-sm`

### Loading Spinner

```html
<div class="spinner"></div>
<div class="spinner spinner-lg"></div>
```

**Sizes:**
- Default: 24px
- Large: 48px

### Do/Don't

#### ✅ DO
- Use semantic color coding
- Animate state changes
- Include text labels
- Match status to service color (wash=blue)

#### ❌ DON'T
- Use vague labels ("OK", "Status 1")
- Rely on color alone (accessibility)
- Animate excessively

---

## Icon System

**File:** `components/icons.css`
**Consistent icon styling**

### Icon Sizes

```html
<svg class="icon icon-sm">...</svg>  <!-- 16px -->
<svg class="icon">...</svg>          <!-- 24px -->
<svg class="icon icon-lg">...</svg>  <!-- 32px -->
<svg class="icon icon-xl">...</svg>  <!-- 48px -->
```

### Icon Rules

**SVG Attributes:**
```xml
<svg
  xmlns="http://www.w3.org/2000/svg"
  width="24"
  height="24"
  viewBox="0 0 24 24"
  fill="none"
  stroke="currentColor"
  stroke-width="2"
  stroke-linecap="square"
  stroke-linejoin="miter"
>
  <!-- paths -->
</svg>
```

**Key Properties:**
- `fill="none"` - Outline style
- `stroke="currentColor"` - Inherits text color
- `stroke-width="2"` - Consistent weight
- `stroke-linecap="square"` - Hard edges (not round)
- `stroke-linejoin="miter"` - Sharp corners

### Required Icons

**Navigation:** arrow-left, arrow-right, chevron-down, menu, close
**Actions:** check, x, plus, minus, edit, refresh
**Service:** washing-machine, dryer, timer, temperature
**Payment:** credit-card, qr-code, cash, nfc
**Status:** info, warning, error, success

---

## Component Composition Example

**Service Selection Screen:**

```html
<div class="card-grid card-grid-3">
  <div class="card card-selectable card-accent-wash" role="button" aria-selected="false">
    <div class="card-service-icon">
      <svg class="icon icon-xl"><!-- Washing machine --></svg>
    </div>
    <h3 class="card-service-title">Standard Wash</h3>
    <p style="color: var(--text-secondary);">Regular cycle for everyday clothes</p>
    <div class="card-service-price">20.000₫</div>
    <button class="btn btn-wash btn-sm">Select</button>
  </div>

  <div class="card card-selectable card-accent-dry" role="button" aria-selected="false">
    <div class="card-service-icon">
      <svg class="icon icon-xl"><!-- Dryer --></svg>
    </div>
    <h3 class="card-service-title">Quick Dry</h3>
    <p style="color: var(--text-secondary);">Fast drying for mixed fabrics</p>
    <div class="card-service-price">15.000₫</div>
    <button class="btn btn-dry btn-sm">Select</button>
  </div>
</div>
```

---

## Accessibility Checklist

### All Components Must Have:
- ✅ Keyboard navigation support
- ✅ Focus indicators (3px ring)
- ✅ ARIA attributes (`aria-label`, `role`, etc.)
- ✅ Color contrast 4.5:1 minimum
- ✅ Touch target 44px minimum (web), 48px (default), 82px (kiosk)
- ✅ Screen reader announcements for state changes

---

## Related Documentation

- [Design Tokens](./02-design-tokens.md) - Token reference
- [Patterns](./04-patterns.md) - Component usage patterns
- [Platform Guidelines](./05-platform-guidelines.md) - Platform-specific variants
- [Animation](./06-animation.md) - Interaction animations
