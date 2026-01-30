# Brand Overview - The Clean Lab

**Design System:** "Titanium Command"
**Version:** 1.0.0
**Last Updated:** 2025-12-12

---

## Design DNA

"Titanium Command" fuses three distinct design philosophies into a cohesive industrial/tactical interface:

### 1. Sci-Fi HUD Aesthetics
- Hard-edged geometric forms
- Chamfered corners (NO rounded)
- Tech grid backgrounds
- Monospace technical typography
- Precision-engineered feel

### 2. Tactical UI Elements
- High-contrast color schemes
- Status indicators and alerts
- Mission-critical action buttons
- Clear information hierarchy
- Industrial durability aesthetic

### 3. Swiss Grid System
- Mathematical spacing (4px base unit)
- Precise alignment
- Clean typography pairing
- Information clarity
- Functional minimalism

**Result:** A brand that feels like operating advanced industrial equipment - precise, reliable, and engineered for heavy-duty commercial use.

---

## Core Design Principles

### 1. NO Rounded Corners
**Non-negotiable rule:** Chamfered corners ONLY.

```css
/* ❌ NEVER */
border-radius: 8px;

/* ✅ ALWAYS */
clip-path: var(--shape-chamfer-sm);
```

**Why?** Rounded corners are consumer-grade softness. Chamfered edges communicate precision, industrial engineering, and tactical equipment aesthetics.

**Chamfer Hierarchy:**
- **sm (8px)** - Buttons, badges, small UI elements
- **md (12px)** - Cards, input fields
- **lg (20px)** - Hero cards, modals, panels
- **xl (30px)** - Major screen sections, kiosk interfaces

### 2. Color = Function
Colors aren't decorative - they communicate service type and status.

**Service Colors:**
- **Tech Blue (#0055FF)** - Wash services, clean operations
- **Dry Orange (#FF4800)** - Dry services, heat operations

**Status Colors:**
- **Success Green (#00CC66)** - Completed, available
- **Error Red (#FF3333)** - Failure, unavailable
- **Warning Amber (#FFAA00)** - Attention required

**Neutral Hierarchy:**
- **Gray 50-200** - Backgrounds, subtle elements
- **Gray 300-500** - Borders, dividers, disabled states
- **Gray 900-Black** - Primary text, strong borders

### 3. Typography as Hierarchy
Two typeface system creates clear functional separation:

**Inter (Sans-serif)** - UI, content, headings
- Weights: 400 (Regular), 600 (SemiBold), 700 (Bold), 800 (ExtraBold), 900 (Black)
- Use for: Headings, body text, button labels, navigation

**JetBrains Mono (Monospace)** - Technical, data, pricing
- Weights: 500 (Medium), 700 (Bold), 800 (ExtraBold)
- Use for: Prices, machine IDs, technical specs, status codes

**Key Rules:**
- Headings ALWAYS uppercase + bold
- Prices ALWAYS monospace
- Body text 16px minimum for readability
- Line-height: 1.1 for headings, 1.5 for body

### 4. 4px Spacing System
All spacing derives from 4px base unit for mathematical precision.

```
4px  → Micro spacing (icon gaps)
8px  → Small spacing (badges)
12px → Compact spacing (card padding)
16px → Default spacing (component gaps)
24px → Medium spacing (section gaps)
32px → Large spacing (card padding)
48px → XL spacing (page sections)
64px → XXL spacing (screen margins)
```

### 5. Touch-First Interaction
Designed for kiosk/POS environments with industrial-grade touch targets.

**Minimum Touch Targets:**
- Web/Mobile: 44px (Apple HIG minimum)
- Default: 48px (comfortable tapping)
- Kiosk: 82px (gloved hands, harsh environments)

---

## Brand Personality

### What We Are
✅ Industrial-grade equipment interface
✅ Tactical command center
✅ Precision-engineered system
✅ Professional laundry technology
✅ High-contrast, high-clarity

### What We're NOT
❌ Consumer-friendly rounded softness
❌ Playful or whimsical
❌ Gradient-heavy modern design
❌ Overly minimalist
❌ Trend-chasing aesthetics

---

## Color Palette

### Primary Accent
**Tech Blue** - Wash service identifier
- Primary: `#0055FF`
- Hover: `#0044CC`
- Use: Primary buttons, wash service cards, active states

### Secondary Accent
**Dry Orange** - Dry service identifier
- Primary: `#FF4800`
- Hover: `#E04000`
- Use: Dry service cards, heat indicators

### Neutrals
**Grayscale Hierarchy**
- White: `#FFFFFF` - Card backgrounds
- Gray 50: `#F8FAFC` - Subtle backgrounds
- Gray 100: `#F0F2F5` - Page background
- Gray 200: `#E2E8F0` - Subtle borders
- Gray 300: `#CBD5E1` - Default borders
- Gray 400: `#94A3B8` - Muted text
- Gray 500: `#64748B` - Secondary text
- Gray 900: `#0F172A` - Primary text
- Black: `#111111` - Strong text, borders

### Status Colors
- Success: `#00CC66` (Green)
- Error: `#FF3333` (Red)
- Warning: `#FFAA00` (Amber)

---

## Typography Pairing

### Inter - UI & Content
**Google Fonts:** `Inter:400,600,700,800,900`

```css
h1 { font: 900 36px/1.1 Inter; }  /* Black weight, tight leading */
h2 { font: 900 30px/1.1 Inter; }
h3 { font: 700 24px/1.25 Inter; }
p  { font: 400 16px/1.5 Inter; }   /* Regular weight, readable leading */
```

**Character:** Neutral, highly legible, supports Vietnamese diacritics

### JetBrains Mono - Technical Data
**Google Fonts:** `JetBrains Mono:500,700,800`

```css
.price { font: 700 24px/1.1 'JetBrains Mono'; }
.code  { font: 500 14px/1.5 'JetBrains Mono'; }
```

**Character:** Technical precision, fixed-width alignment, developer-friendly

---

## Design Rules Reference

### ✅ DO
- Use chamfered corners exclusively
- Uppercase headings for emphasis
- High contrast text (4.5:1 minimum)
- 4px-based spacing
- Semantic color usage (blue = wash, orange = dry)
- Monospace for prices/technical data
- 82px touch targets for kiosk
- Tech grid backgrounds for visual interest

### ❌ DON'T
- Round any corners (instant brand violation)
- Mix service colors (blue wash with orange button)
- Use decorative fonts
- Ignore touch target minimums
- Use gradients or shadows excessively
- Center-align body text
- Stack multiple primary buttons
- Override chamfer with border-radius

---

## Platform Considerations

### Web (Desktop/Mobile Browser)
- Responsive breakpoints (640/768/1024/1280px)
- Hover states for interactive elements
- 44-48px touch targets

### Mobile Native (iOS/Android)
- React Native or Flutter tokens available
- Platform-specific font loading
- 44px minimum (iOS HIG requirement)

### Kiosk/POS (Industrial Touch)
- 82px touch targets for gloved operation
- High-contrast mode always on
- Simplified navigation (max 3 levels deep)
- Hardware integration zones (card reader, bill acceptor)

---

## File Structure Reference

```
src/styles/
├── tokens/          # Design tokens (Foundation + Semantic)
├── components/      # Button, Card, Form, etc.
├── platforms/       # Web, Kiosk, Mobile variants
├── animations/      # Motion system
└── index.css        # Main entry point

docs/design-guidelines/
├── 01-brand-overview.md       ← You are here
├── 02-design-tokens.md
├── 03-components.md
├── 04-patterns.md
├── 05-platform-guidelines.md
├── 06-animation.md
└── 07-quick-start.md
```

---

## Next Steps

1. Review [Design Tokens](./02-design-tokens.md) for complete token reference
2. Explore [Components](./03-components.md) for UI building blocks
3. See [Quick Start](./07-quick-start.md) to begin implementation

---

## Questions?

- Token not listed? Check `src/styles/tokens/`
- Component variant needed? File issue/PR
- Platform-specific guidance? See [Platform Guidelines](./05-platform-guidelines.md)
