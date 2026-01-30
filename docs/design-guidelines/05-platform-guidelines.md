# Platform Guidelines - The Clean Lab

**Version:** 1.0.0
**Platforms:** Web, Mobile (iOS/Android), Kiosk/POS

---

## Platform Overview

The Clean Lab design system adapts to three primary platforms while maintaining brand consistency:

| Platform | Environment | Key Constraints |
|----------|-------------|-----------------|
| **Web** | Desktop/mobile browsers | Responsive, hover states, multi-device |
| **Mobile** | iOS/Android native apps | Touch-first, platform guidelines, smaller screens |
| **Kiosk** | Industrial touchscreen POS | Large touch targets, distance viewing, hardware integration |

---

## Web Platform

**File:** `src/styles/platforms/web.css`
**Target:** Desktop and mobile web browsers

### Breakpoints

```css
/* Mobile-first approach */
@media (min-width: 640px) {  /* sm: Mobile landscape, small tablets */}
@media (min-width: 768px) {  /* md: Tablet portrait */}
@media (min-width: 1024px) { /* lg: Tablet landscape, desktop */}
@media (min-width: 1280px) { /* xl: Large desktop */}
@media (min-width: 1536px) { /* 2xl: Extra large desktop */}
```

### Responsive Strategy

#### Mobile (320px - 639px)
```css
/* Single column layout */
.container {
  padding: var(--space-4);
  max-width: 100%;
}

/* Full-width cards */
.card-grid {
  grid-template-columns: 1fr;
}

/* Stack navigation */
.header-nav {
  flex-direction: column;
}
```

#### Tablet (640px - 1023px)
```css
/* 2-column grids */
.card-grid {
  grid-template-columns: repeat(2, 1fr);
}

/* Horizontal navigation */
.header-nav {
  flex-direction: row;
}
```

#### Desktop (1024px+)
```css
/* Multi-column grids */
.card-grid {
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
}

/* Sidebar layouts */
.layout-with-sidebar {
  grid-template-columns: 280px 1fr;
}
```

### Touch Target Sizing

```css
/* Minimum touch targets per platform */
.btn {
  min-height: 44px; /* iOS HIG minimum */
}

@media (min-width: 768px) {
  .btn {
    min-height: 48px; /* Comfortable default */
  }
}
```

### Hover States

**Only apply hover effects on devices with pointer support:**

```css
@media (hover: hover) and (pointer: fine) {
  .btn:hover {
    background: var(--accent-primary-hover);
  }

  .card-selectable:hover {
    border-color: var(--accent-primary);
    box-shadow: var(--shadow-md);
  }
}
```

### Focus States

**Always visible for keyboard navigation:**

```css
.btn:focus-visible {
  outline: 3px solid var(--accent-primary);
  outline-offset: 2px;
}

/* Never hide focus indicators */
.btn:focus:not(:focus-visible) {
  outline: none;
}
```

### Web-Specific Components

#### Sticky Header
```css
.header {
  position: sticky;
  top: 0;
  z-index: 100;
  background: var(--bg-secondary);
  border-bottom: 2px solid var(--border-default);
}
```

#### Modal Overlay
```css
.modal-overlay {
  position: fixed;
  inset: 0;
  background: rgba(17, 17, 17, 0.8);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
}

.modal {
  background: var(--bg-secondary);
  padding: var(--space-8);
  clip-path: var(--shape-chamfer-xl);
  max-width: 600px;
  max-height: 80vh;
  overflow-y: auto;
}
```

### Web Performance

#### Font Loading
```css
/* Preload critical fonts */
<link rel="preload" href="/fonts/inter-bold.woff2" as="font" type="font/woff2" crossorigin>
<link rel="preload" href="/fonts/jetbrains-mono-bold.woff2" as="font" type="font/woff2" crossorigin>

/* Display swap for performance */
@font-face {
  font-family: 'Inter';
  font-display: swap;
  src: url('/fonts/inter-bold.woff2') format('woff2');
}
```

#### Reduced Motion
```css
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

### Web Do/Don't

#### ✅ DO
- Use mobile-first responsive design
- Test on Chrome, Firefox, Safari, Edge
- Provide hover feedback (when supported)
- Always show focus indicators
- Optimize for performance (lazy load, code split)
- Support keyboard navigation
- Test on real devices

#### ❌ DON'T
- Assume mouse availability
- Hide focus outlines
- Force desktop-only layouts
- Ignore mobile Safari quirks
- Hardcode pixel widths
- Forget to test touch interactions

---

## Mobile Platform (Native)

**Platforms:** iOS (Swift/SwiftUI), Android (Kotlin/Compose), React Native, Flutter

### Platform-Specific Guidelines

#### iOS (HIG Compliance)
```swift
// Minimum touch target: 44pt
// Spacing: 8pt base unit (matches 4px on 2x screens)

struct CleanLabButton: View {
    var body: some View {
        Button(action: {}) {
            Text("ACTIVATE WASH")
                .font(.custom("Inter-Bold", size: 16))
                .textCase(.uppercase)
                .frame(minHeight: 44)
                .padding(.horizontal, 24)
        }
        .buttonStyle(ChamferedButtonStyle())
    }
}

// Custom chamfer shape
struct ChamferShape: Shape {
    var chamfer: CGFloat = 8

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: chamfer, y: 0))
        path.addLine(to: CGPoint(x: rect.width - chamfer, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: chamfer))
        // ... continue polygon
        return path
    }
}
```

#### Android (Material Design Adaptation)
```kotlin
// Minimum touch target: 48dp
// Spacing: 4dp base unit

@Composable
fun CleanLabButton(
    text: String,
    onClick: () -> Unit
) {
    Button(
        onClick = onClick,
        modifier = Modifier
            .heightIn(min = 48.dp)
            .padding(horizontal = 24.dp),
        shape = ChamferShape(8.dp), // Custom chamfer shape
        colors = ButtonDefaults.buttonColors(
            containerColor = Color(0xFF0055FF)
        )
    ) {
        Text(
            text = text.uppercase(),
            style = TextStyle(
                fontFamily = FontFamily(Font(R.font.inter_bold)),
                fontSize = 16.sp,
                letterSpacing = 0.05.em
            )
        )
    }
}
```

#### React Native
```javascript
// Token export for RN
export const tokens = {
  colors: {
    accentPrimary: '#0055FF',
    textPrimary: '#111111',
    bgPrimary: '#F0F2F5',
  },
  spacing: {
    base: 4,
    xs: 4,
    sm: 8,
    md: 12,
    lg: 16,
  },
  typography: {
    heading1: {
      fontFamily: 'Inter-Black',
      fontSize: 36,
      lineHeight: 40,
      textTransform: 'uppercase',
    },
  },
};

// Chamfered button component
const ChamferedButton = ({ children, onPress }) => (
  <Pressable
    onPress={onPress}
    style={styles.button}
  >
    <Svg>
      <Defs>
        <ClipPath id="chamfer">
          <Polygon points="8,0 292,0 300,8 300,40 292,48 8,48 0,40 0,8" />
        </ClipPath>
      </Defs>
      <Rect
        width="300"
        height="48"
        fill="#0055FF"
        clipPath="url(#chamfer)"
      />
    </Svg>
    <Text style={styles.buttonText}>{children}</Text>
  </Pressable>
);
```

#### Flutter
```dart
// Token file: lib/design/tokens.dart
class CleanLabTokens {
  // Colors
  static const accentPrimary = Color(0xFF0055FF);
  static const textPrimary = Color(0xFF111111);

  // Typography
  static const heading1 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 36,
    fontWeight: FontWeight.w900,
    height: 1.1,
  );

  // Spacing
  static const space4 = 16.0;
  static const space6 = 24.0;
}

// Chamfered button widget
class ChamferedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ChamferClipper(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(120, 48),
          backgroundColor: CleanLabTokens.accentPrimary,
          padding: EdgeInsets.symmetric(
            horizontal: CleanLabTokens.space6,
            vertical: 12,
          ),
        ),
        child: Text(
          label.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 0.05,
          ),
        ),
      ),
    );
  }
}
```

### Mobile Touch Targets

```
iOS HIG: 44pt minimum
Android Material: 48dp minimum
Clean Lab: 48px/dp/pt default (comfortable)
```

### Mobile-Specific Patterns

#### Pull-to-Refresh
- Use platform-native refresh indicators
- Show loading state clearly
- Provide haptic feedback on iOS

#### Swipe Actions
- Left swipe for destructive actions (delete)
- Right swipe for positive actions (mark complete)
- Visual feedback during swipe

#### Bottom Sheets
- Use for secondary actions
- Maintain chamfered corners
- Swipe-down to dismiss

### Mobile Do/Don't

#### ✅ DO
- Follow platform guidelines (HIG, Material)
- Use platform-native navigation patterns
- Provide haptic feedback (iOS)
- Support system dark mode
- Test on physical devices
- Optimize for one-handed use
- Support landscape orientation

#### ❌ DON'T
- Mix iOS and Android patterns
- Ignore safe area insets
- Forget status bar styling
- Use non-native fonts without embedding
- Hardcode screen dimensions
- Block UI thread with animations

---

## Kiosk/POS Platform

**File:** `src/styles/platforms/kiosk.css`
**Target:** 21.5" 1080p industrial touchscreen (1920×1080)
**Viewing Distance:** 50-100cm
**Touch Target:** 82px minimum

### Display Specifications

```css
:root {
  --kiosk-width: 1920px;
  --kiosk-height: 1080px;
  --kiosk-dpi: 102; /* approximate */
}

.platform-kiosk {
  /* Enlarged for distance viewing */
  --text-base: 20px;
  --text-xl: 28px;
  --text-4xl: 48px;

  /* Industrial touch targets */
  --touch-target-min: 82px;
  --touch-target-spacing: 21px;

  /* Stronger borders for visibility */
  --border-width-md: 3px;
  --border-width-lg: 4px;
}
```

### Kiosk Layout System

#### Full-Screen App Layout
```html
<div class="kiosk-layout">
  <!-- Header: Branding, time, status -->
  <header class="kiosk-header">
    <h1>THE CLEAN LAB</h1>
    <div class="kiosk-time">14:35</div>
  </header>

  <!-- Main Content: Interactive elements -->
  <main class="kiosk-content">
    <!-- User flows here -->
  </main>

  <!-- Hardware Zone: NFC, card, bill, printer -->
  <footer class="kiosk-hardware-zone">
    <div class="kiosk-hardware-indicator">
      <div class="kiosk-hardware-icon">💳</div>
      <span>Insert Card</span>
    </div>
    <div class="kiosk-hardware-indicator">
      <div class="kiosk-hardware-icon">💵</div>
      <span>Insert Bills</span>
    </div>
    <div class="kiosk-hardware-indicator">
      <div class="kiosk-hardware-icon">📱</div>
      <span>Tap NFC</span>
    </div>
  </footer>
</div>
```

### Kiosk Touch Targets

```css
/* 82px minimum per HMI standards */
.btn-kiosk {
  min-height: 82px;
  min-width: 160px;
  font-size: 28px;
  margin: 10px; /* 21px spacing / 2 */
}

/* Hero buttons for primary actions */
.btn-kiosk-hero {
  min-height: 200px;
  min-width: 300px;
  font-size: 40px;
}
```

### Kiosk Typography

```css
/* Distance-optimized sizing */
.kiosk-heading-1 { font-size: 48px; }  /* Screen titles */
.kiosk-heading-2 { font-size: 40px; }  /* Section headers */
.kiosk-body { font-size: 24px; }        /* Body text */
.kiosk-price { font-size: 40px; }       /* Prices */
```

### Kiosk Grid Layouts

```css
/* 3-column grid for service/payment selection */
.kiosk-grid-3 {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 24px; /* --space-6 */
}

/* 2-column grid for machine selection */
.kiosk-grid-2 {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 32px; /* --space-8 */
}
```

### High Contrast Mode

**For bright ambient light (storefront windows):**

```css
.kiosk-high-contrast {
  --text-primary: #000000;
  --bg-primary: #ffffff;
  --border-strong: #000000;
  --accent-primary: #0044cc; /* Darker for 7:1 contrast */
}

.kiosk-high-contrast .btn-kiosk {
  border-width: 4px; /* Extra strong borders */
}
```

### Idle Timeout

```html
<!-- Timeout warning -->
<div class="kiosk-timeout">
  Session ending in 30 seconds...
</div>
```

```css
.kiosk-timeout {
  position: fixed;
  top: 16px;
  right: 16px;
  padding: 12px 24px;
  background: var(--status-warning);
  color: white;
  font-size: 24px;
  animation: pulse 1s infinite;
}
```

### Hardware Integration Zones

```
┌──────────────────────────────────┐
│  Header (80px)                    │ ← Branding, time
├──────────────────────────────────┤
│                                   │
│  Main Content (800px)             │ ← User interactions
│                                   │
├──────────────────────────────────┤
│  Hardware Zone (200px)            │ ← Device indicators
│  [Card] [Bill] [NFC] [Receipt]   │
└──────────────────────────────────┘
```

### Kiosk Do/Don't

#### ✅ DO
- Use 82px minimum touch targets
- Enlarge typography for distance (20px+ body)
- Provide clear device instructions
- Include idle timeout (60-90s)
- Show hardware status indicators
- Use high contrast mode option
- Test with gloved hands
- Support fullscreen mode

#### ❌ DON'T
- Use hover states (no cursor)
- Assume fine motor control
- Hide critical info in small text
- Forget idle timeout
- Use subtle colors/borders
- Require scrolling if possible
- Nest navigation deeply (max 3 levels)

---

## Cross-Platform Token Export

### CSS Variables (Web)
```css
@import './tokens/index.css';
```

### JSON (React Native, Flutter)
```json
{
  "colors": {
    "accent": {
      "primary": { "value": "#0055FF" }
    }
  },
  "spacing": {
    "4": { "value": "16px" }
  }
}
```

### Swift (iOS)
```swift
// Tokens.swift
enum CleanLabTokens {
    enum Colors {
        static let accentPrimary = Color(hex: "0055FF")
    }
    enum Spacing {
        static let base: CGFloat = 4
        static let space4: CGFloat = 16
    }
}
```

### Kotlin (Android)
```xml
<!-- tokens.xml -->
<resources>
    <color name="accent_primary">#0055FF</color>
    <dimen name="space_4">16dp</dimen>
</resources>
```

---

## Accessibility Across Platforms

### Touch Target Minimums
- **iOS:** 44pt (HIG requirement)
- **Android:** 48dp (Material guideline)
- **Web:** 44-48px (WCAG 2.5.5)
- **Kiosk:** 82px (HMI standard)

### Color Contrast
- **AA:** 4.5:1 for text, 3:1 for UI
- **AAA:** 7:1 for text (kiosk high contrast)

### Screen Reader Support
- iOS: VoiceOver
- Android: TalkBack
- Web: NVDA, JAWS, VoiceOver

---

## Related Documentation

- [Design Tokens](./02-design-tokens.md) - Token reference
- [Components](./03-components.md) - Component library
- [Patterns](./04-patterns.md) - UI patterns
- [Animation](./06-animation.md) - Motion system
