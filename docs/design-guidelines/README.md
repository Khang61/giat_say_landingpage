# The Clean Lab Design Guidelines

**"Titanium Command"** - Industrial/Tactical Design System
**Version:** 1.0.0
**Last Updated:** 2025-12-12

---

## Overview

Complete design system documentation for The Clean Lab laundry service platform. "Titanium Command" fuses sci-fi HUD aesthetics, tactical UI precision, and Swiss grid clarity into a cohesive industrial-grade interface.

---

## Documentation Structure

### [01. Brand Overview](./01-brand-overview.md)
**What you'll learn:**
- "Titanium Command" design DNA
- Core design principles (NO rounded corners!)
- Color palette philosophy
- Typography pairing rationale
- Brand personality & voice

**Read this first** to understand the "why" behind design decisions.

---

### [02. Design Tokens](./02-design-tokens.md)
**What you'll learn:**
- 3-tier token architecture (Foundation → Semantic → Component)
- Complete color token reference
- Typography scale & presets
- Spacing system (4px base)
- Chamfer shape tokens
- Platform-specific token export

**Read this** when implementing components or customizing the system.

---

### [03. Components](./03-components.md)
**What you'll learn:**
- Button system (variants, sizes, states)
- Card components (base, selectable, service cards)
- Form elements (input, textarea, select, checkbox, radio)
- Header/navigation patterns
- Status indicators (badges, dots, progress bars)
- Icon system guidelines

**Read this** when building UI elements.

---

### [04. Patterns](./04-patterns.md)
**What you'll learn:**
- Payment flow pattern (QR, Card, Cash)
- Machine selection pattern
- Service selection pattern
- Status display pattern
- Success/error state patterns

**Read this** when implementing user flows.

---

### [05. Platform Guidelines](./05-platform-guidelines.md)
**What you'll learn:**
- Web platform (responsive, hover, focus states)
- Mobile platform (iOS, Android, React Native, Flutter)
- Kiosk/POS platform (82px touch targets, hardware zones)
- Platform-specific token exports
- Touch target sizing per platform

**Read this** when adapting design to specific platforms.

---

### [06. Animation](./06-animation.md)
**What you'll learn:**
- Motion tokens (durations, easing functions)
- Component animations (button press, card selection)
- Device feedback animations (NFC, card, bill)
- Page transitions
- Status animations
- Reduced motion support

**Read this** when adding interactions and transitions.

---

### [07. Quick Start](./07-quick-start.md)
**What you'll learn:**
- Installation steps (CSS, React, React Native)
- File structure overview
- First component examples
- Common pattern implementations
- Debugging checklist
- FAQs

**Read this** to get started implementing quickly.

---

## Quick Links

### Getting Started
- [Quick Start Guide](./07-quick-start.md) - 10-minute setup
- [Brand Overview](./01-brand-overview.md) - Core principles
- [Design Tokens](./02-design-tokens.md) - Token reference

### Component Reference
- [Components](./03-components.md) - Full component library
- [Patterns](./04-patterns.md) - Common UI flows
- [Animation](./06-animation.md) - Motion system

### Platform-Specific
- [Web Guidelines](./05-platform-guidelines.md#web-platform)
- [Mobile Guidelines](./05-platform-guidelines.md#mobile-platform-native)
- [Kiosk Guidelines](./05-platform-guidelines.md#kioskpos-platform)

---

## Design Principles At-A-Glance

### 1. NO Rounded Corners
**Non-negotiable.** Use chamfered corners exclusively.

```css
/* ❌ NEVER */
border-radius: 8px;

/* ✅ ALWAYS */
clip-path: var(--shape-chamfer-sm);
```

### 2. Color = Function
- **Tech Blue (#0055FF)** = Wash/clean services
- **Dry Orange (#FF4800)** = Dry/heat services
- **Green/Red/Amber** = Status (success/error/warning)

### 3. Typography Hierarchy
- **Inter** - UI, content, headings
- **JetBrains Mono** - Prices, technical data, codes

### 4. 4px Spacing System
All spacing derives from 4px base unit for mathematical precision.

### 5. Touch-First Interaction
- Web/Mobile: 44-48px targets
- Kiosk: 82px targets (gloved hands)

---

## Key Token Reference

### Colors
```css
--accent-primary: #0055FF;        /* Tech Blue */
--accent-wash: #0055FF;           /* Wash service */
--accent-dry: #FF4800;            /* Dry service */
--text-primary: #111111;          /* Main text */
--bg-primary: #F0F2F5;            /* Page background */
--bg-secondary: #FFFFFF;          /* Card background */
```

### Typography
```css
--heading-1: 900 36px/1.1 Inter;           /* Hero */
--body-base: 400 16px/1.5 Inter;           /* Body */
--tech-price: 700 24px/1.1 'JetBrains Mono'; /* Prices */
```

### Spacing
```css
--space-2: 8px;    /* Tight */
--space-4: 16px;   /* Default */
--space-6: 24px;   /* Comfortable */
--space-8: 32px;   /* Spacious */
```

### Chamfers
```css
--shape-chamfer-sm: polygon(...);  /* 8px - buttons */
--shape-chamfer-md: polygon(...);  /* 12px - inputs */
--shape-chamfer-lg: polygon(...);  /* 20px - cards */
--shape-chamfer-xl: polygon(...);  /* 30px - sections */
```

---

## Component Examples

### Button
```html
<button class="btn btn-primary">Start Wash</button>
<button class="btn btn-secondary">View Details</button>
<button class="btn btn-ghost">Cancel</button>
```

### Card
```html
<div class="card card-selectable card-accent-wash">
  <h3>Standard Wash</h3>
  <p>Regular cycle for everyday clothes</p>
  <div class="card-service-price">20.000₫</div>
</div>
```

### Form
```html
<input type="text" class="input" placeholder="Enter name">
<textarea class="textarea" rows="4"></textarea>
<select class="select">
  <option>Option 1</option>
</select>
```

### Status
```html
<span class="status status-success">Available</span>
<span class="status status-warning">In Use</span>
<span class="status status-error">Offline</span>
```

---

## File Locations

### Documentation
```
docs/design-guidelines/
├── README.md                     ← You are here
├── 01-brand-overview.md
├── 02-design-tokens.md
├── 03-components.md
├── 04-patterns.md
├── 05-platform-guidelines.md
├── 06-animation.md
└── 07-quick-start.md
```

### Source Files
```
src/styles/
├── index.css                # Main entry point
├── base.css                 # Reset + base styles
├── tokens/                  # Design tokens
│   ├── foundation/         # Raw values
│   ├── semantic/           # Purpose-mapped
│   └── tokens.json         # Design tool export
├── components/              # Button, Card, Form, etc.
├── platforms/               # Web, Kiosk variants
└── animations/              # Motion system
```

---

## Design Tool Integration

### Figma
- Import `tokens.json` via Tokens Studio plugin
- Sync variables to Figma design file
- Export components as variants

### Sketch
- Use Sketch Tokens plugin
- Import JSON token file
- Create symbols from components

### Adobe XD
- Manual token mapping
- Component library setup
- Shared libraries

---

## Version History

### 1.0.0 (2025-12-12)
- Initial release
- Complete token system
- Component library
- Platform guidelines
- Animation system

---

## Contributing

### Proposing Changes
1. Review existing documentation
2. Create proposal with rationale
3. Design review → Dev review
4. Implementation → Testing
5. Documentation update
6. Version bump

### Versioning
- **MAJOR:** Breaking changes (renamed/removed tokens)
- **MINOR:** New features (new components, variants)
- **PATCH:** Bug fixes (visual fixes, doc updates)

---

## Support

### Questions?
- Check [Quick Start](./07-quick-start.md) FAQs
- Review relevant documentation section
- Check component CSS source files
- File issue for bugs/feature requests

### Resources
- Design Files: `src/styles/`
- Token Export: `src/styles/tokens/tokens.json`
- Token Demo: `src/token-demo.html`

---

## Design Philosophy

> "The Clean Lab design system isn't about making laundry services look 'pretty' - it's about creating an interface that feels like operating precision industrial equipment. Every interaction should communicate reliability, efficiency, and professional-grade quality."

**Core Values:**
- **Precision** over decoration
- **Clarity** over complexity
- **Function** over form (but make the form badass)
- **Industrial** over consumer
- **Tactical** over trendy

---

## What Makes "Titanium Command" Different

### Traditional Laundry UI
- Rounded corners everywhere
- Soft pastel colors
- Playful illustrations
- Consumer-friendly softness

### Titanium Command
- **Chamfered** corners (precision-cut edges)
- **High-contrast** colors (tech blue, dry orange)
- **Technical** typography (monospace prices)
- **Industrial** durability aesthetic
- **Tactical** UI elements (status indicators, device zones)

**Result:** A brand that looks like it could survive a zombie apocalypse while still doing your laundry.

---

## License & Usage

Design system available for The Clean Lab platform and affiliated projects. Contact for licensing inquiries.

**© 2025 The Clean Lab**
