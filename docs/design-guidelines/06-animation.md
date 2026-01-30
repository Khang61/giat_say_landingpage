# Animation & Motion - The Clean Lab

**Version:** 1.0.0
**System:** "Titanium Command" Motion System
**Location:** `src/styles/animations/`

---

## Motion Principles

Animation in "Titanium Command" serves three purposes:
1. **Feedback** - Confirm user actions
2. **Guidance** - Direct attention
3. **Personality** - Reinforce industrial/tactical feel

**Key Rule:** Motion should feel **precise, mechanical, and purposeful** - like industrial equipment responding to commands.

---

## Motion Tokens

**File:** `animations/motion-tokens.css`

### Durations

```css
--duration-instant: 100ms;   /* Micro-interactions */
--duration-fast: 150ms;      /* Button press, toggles */
--duration-normal: 250ms;    /* Card selection, state changes */
--duration-slow: 400ms;      /* Page transitions */
--duration-slower: 600ms;    /* Dramatic effects, screen switches */
```

**Usage Guidelines:**
- **Instant (100ms):** Touch feedback, button active state
- **Fast (150ms):** Hover states, color changes
- **Normal (250ms):** Card selection, modal open/close
- **Slow (400ms):** Page transitions, complex animations
- **Slower (600ms):** Dramatic reveals, success screens

### Easing Functions

```css
--ease-default: cubic-bezier(0.4, 0, 0.2, 1);     /* Balanced */
--ease-in: cubic-bezier(0.4, 0, 1, 1);            /* Accelerate */
--ease-out: cubic-bezier(0, 0, 0.2, 1);           /* Decelerate */
--ease-bounce: cubic-bezier(0.34, 1.56, 0.64, 1); /* Playful overshoot */
--ease-spring: cubic-bezier(0.175, 0.885, 0.32, 1.275); /* Natural motion */
```

**Character:**
- **default:** Smooth, professional
- **in:** Powerful startup
- **out:** Confident stop
- **bounce:** Playful (use sparingly)
- **spring:** Natural (organic feel)

### Standard Transitions

```css
--transition-fast: var(--duration-fast) var(--ease-default);
--transition-normal: var(--duration-normal) var(--ease-default);
--transition-slow: var(--duration-slow) var(--ease-default);

/* Property-specific */
--transition-transform: transform var(--duration-fast) var(--ease-out);
--transition-opacity: opacity var(--duration-normal) var(--ease-default);
--transition-background: background var(--duration-fast) var(--ease-default);
--transition-border: border-color var(--duration-fast) var(--ease-default);
```

---

## Component Animations

**File:** `animations/buttons.css`, `animations/cards.css`, etc.

### Button Animations

#### Press Animation
```css
.btn:active {
  transform: scale(0.96);
  transition: transform var(--duration-instant) var(--ease-out);
}
```

**Effect:** Button "compresses" when pressed, mimicking physical button

#### Loading State
```css
.btn[aria-busy="true"]::after {
  content: '';
  width: 16px;
  height: 16px;
  border: 2px solid currentColor;
  border-right-color: transparent;
  border-radius: 50%;
  animation: btn-spin 0.6s linear infinite;
}

@keyframes btn-spin {
  to { transform: rotate(360deg); }
}
```

**Effect:** Spinning loader indicates processing

#### Hover (Web)
```css
.btn:hover {
  background: var(--accent-primary-hover);
  transition: background var(--duration-fast) var(--ease-default);
}
```

### Card Animations

#### Selection
```css
.card-selectable {
  transition:
    transform var(--duration-fast) var(--ease-out),
    border-color var(--duration-normal) var(--ease-default),
    background var(--duration-normal) var(--ease-default);
}

.card-selectable:active {
  transform: scale(0.98);
}

.card-selectable[aria-selected="true"] {
  background: var(--bg-inverse);
  border-color: var(--accent-primary);
}
```

**Effect:** Card scales down slightly when pressed, then smoothly transitions to selected state

#### Entrance (Stagger)
```css
@keyframes card-enter {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.card {
  animation: card-enter var(--duration-normal) var(--ease-out);
}

/* Stagger delay for grid */
.card:nth-child(1) { animation-delay: 0ms; }
.card:nth-child(2) { animation-delay: 50ms; }
.card:nth-child(3) { animation-delay: 100ms; }
.card:nth-child(4) { animation-delay: 150ms; }
```

**Effect:** Cards appear sequentially, creating cascading entrance

### Form Animations

#### Focus Ring
```css
.input:focus {
  border-color: var(--accent-primary);
  box-shadow: 0 0 0 3px rgba(0, 85, 255, 0.15);
  transition:
    border-color var(--duration-fast) var(--ease-default),
    box-shadow var(--duration-normal) var(--ease-out);
}
```

#### Error Shake
```css
@keyframes input-error-shake {
  0%, 100% { transform: translateX(0); }
  25% { transform: translateX(-8px); }
  75% { transform: translateX(8px); }
}

.input-error {
  animation: input-error-shake var(--duration-fast) var(--ease-default);
}
```

**Effect:** Input shakes horizontally to indicate error

---

## Device Feedback Animations

**File:** `animations/devices.css`

### NFC Tap Animation

```css
@keyframes nfc-pulse {
  0%, 100% {
    opacity: 1;
    transform: scale(1);
  }
  50% {
    opacity: 0.5;
    transform: scale(1.2);
  }
}

.device-nfc-active {
  animation: nfc-pulse 1.5s ease-in-out infinite;
}
```

**Effect:** Pulsing indicator shows NFC reader is active and waiting

### Card Reader Animation

```css
@keyframes card-insert {
  0% {
    transform: translateY(40px);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

.device-card-inserting {
  animation: card-insert var(--duration-normal) var(--ease-out);
}
```

**Effect:** Visual representation of card being inserted

### Bill Acceptor Animation

```css
@keyframes bill-count {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}

.device-bill-counting {
  animation: bill-count var(--duration-fast) ease-in-out;
}
```

**Effect:** Bill icon "jumps" when bill is accepted

### Processing Spinner

```css
@keyframes spinner-rotate {
  to { transform: rotate(360deg); }
}

.spinner {
  width: 48px;
  height: 48px;
  border: 4px solid var(--color-gray-200);
  border-top-color: var(--accent-primary);
  clip-path: var(--shape-chamfer-sm); /* Chamfered spinner! */
  animation: spinner-rotate 0.8s linear infinite;
}
```

**Effect:** Chamfered square rotates to indicate loading

---

## Page Transitions

**File:** `animations/pages.css`

### Fade In/Out

```css
@keyframes page-fade-in {
  from { opacity: 0; }
  to { opacity: 1; }
}

.page-enter {
  animation: page-fade-in var(--duration-slow) var(--ease-default);
}
```

### Slide Transitions

```css
@keyframes page-slide-left {
  from { transform: translateX(100%); }
  to { transform: translateX(0); }
}

@keyframes page-slide-right {
  from { transform: translateX(-100%); }
  to { transform: translateX(0); }
}

.page-enter-forward {
  animation: page-slide-left var(--duration-slow) var(--ease-out);
}

.page-enter-backward {
  animation: page-slide-right var(--duration-slow) var(--ease-out);
}
```

**Effect:** Page slides in from right (forward nav) or left (back nav)

---

## Status Animations

**File:** `animations/status.css`

### Success Animation

```css
@keyframes success-scale {
  0% {
    transform: scale(0);
    opacity: 0;
  }
  50% {
    transform: scale(1.1);
  }
  100% {
    transform: scale(1);
    opacity: 1;
  }
}

.result-icon-success {
  animation: success-scale var(--duration-slow) var(--ease-spring);
}
```

**Effect:** Success checkmark "pops" into view with bounce

### Error Animation

```css
@keyframes error-shake {
  0%, 100% { transform: translateX(0) rotate(0deg); }
  25% { transform: translateX(-10px) rotate(-3deg); }
  75% { transform: translateX(10px) rotate(3deg); }
}

.result-icon-error {
  animation: error-shake var(--duration-normal) var(--ease-default);
}
```

**Effect:** Error icon shakes to draw attention

### Progress Bar Fill

```css
@keyframes progress-fill {
  from { width: 0%; }
  to { width: var(--progress-value); }
}

.progress-bar-fill {
  animation: progress-fill var(--duration-slow) var(--ease-out);
}
```

**Effect:** Progress bar smoothly fills to target value

### Status Dot Pulse

```css
@keyframes status-pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}

.status-dot-warning {
  animation: status-pulse 1.5s ease-in-out infinite;
}
```

**Effect:** Warning status dot pulses to indicate active state

---

## Tactical UI Effects

**File:** `animations/effects.css`

### Scan Line Animation

```css
@keyframes scan-line {
  0% { transform: translateY(-100%); }
  100% { transform: translateY(100%); }
}

.scan-lines::after {
  content: '';
  position: absolute;
  inset: 0;
  background: linear-gradient(
    to bottom,
    transparent,
    rgba(0, 85, 255, 0.1) 50%,
    transparent
  );
  animation: scan-line 3s linear infinite;
}
```

**Effect:** Retro CRT scan line sweeps across element

### Glitch Effect

```css
@keyframes glitch {
  0%, 100% { transform: translate(0); }
  33% { transform: translate(-2px, 2px); }
  66% { transform: translate(2px, -2px); }
}

.glitch-effect {
  animation: glitch 0.3s ease-in-out;
}
```

**Effect:** Brief digital "glitch" for dramatic error states

### Tech Grid Parallax

```css
@keyframes grid-parallax {
  0% { background-position: 0 0; }
  100% { background-position: 20px 20px; }
}

.tech-grid {
  animation: grid-parallax 20s linear infinite;
}
```

**Effect:** Subtle grid movement creates depth

---

## Reduced Motion Support

**Critical for accessibility:**

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }

  /* Preserve essential feedback */
  .btn:active {
    transform: scale(0.98);
  }
}
```

**Effect:** Respects user's motion preferences while maintaining essential feedback

---

## Animation Timing Examples

### Quick Interactions (100-150ms)
- Button press
- Hover state change
- Toggle switch
- Checkbox check

### Standard Interactions (250ms)
- Card selection
- Modal open/close
- Dropdown expand
- Tab switch

### Page Transitions (400-600ms)
- Screen change
- Success/error reveal
- Payment processing transition
- Idle timeout countdown

---

## Motion Do/Don't

### ✅ DO
- Use motion to confirm actions
- Keep animations under 400ms
- Provide feedback for all interactions
- Use consistent easing functions
- Respect `prefers-reduced-motion`
- Test animations on actual hardware
- Use mechanical/precise timing

### ❌ DON'T
- Animate for decoration only
- Use slow animations (>600ms)
- Rely on animation to convey critical info
- Mix easing functions arbitrarily
- Forget reduced motion support
- Overuse bounce/spring effects
- Ignore performance impact

---

## Animation Performance

### GPU Acceleration

```css
/* Use transform and opacity for best performance */
.animated-element {
  transform: translateZ(0); /* Force GPU layer */
  will-change: transform; /* Hint to browser */
}

/* Avoid animating these (expensive) */
/* ❌ width, height, margin, padding, top, left */

/* Prefer these (cheap) */
/* ✅ transform, opacity */
```

### Animation Testing

**Test on:**
- Low-end devices (budget phones)
- Kiosk hardware (industrial PCs)
- Multiple browsers (Safari animations can differ)
- High refresh rate displays (120Hz+)

---

## Related Documentation

- [Design Tokens](./02-design-tokens.md) - Motion tokens reference
- [Components](./03-components.md) - Component interaction states
- [Patterns](./04-patterns.md) - Pattern-specific animations
- [Platform Guidelines](./05-platform-guidelines.md) - Platform motion differences
