# Platform Adaptations - The Clean Lab

"Titanium Command" Industrial/Tactical Design System

Cross-platform token mappings and implementation guides for Web, Mobile (React Native/Flutter), and HMI Kiosk platforms.

---

## Directory Structure

```
src/platforms/
├── react-native/
│   └── tokens.ts         # RN token mapping + helper functions
├── flutter/
│   └── tokens.dart       # Flutter token mapping + ChamferedBorder
└── README.md             # This file
```

```
src/styles/platforms/
├── web.css               # Web-specific styles
├── kiosk.css             # HMI kiosk styles
└── index.css             # Platform imports
```

---

## Platform Overview

| Feature | Web | React Native | Flutter | HMI Kiosk |
|---------|-----|--------------|---------|-----------|
| Min touch target | 44px | 44px | 44px | 82px |
| Base font size | 16px | 16px | 16px | 20px |
| Hover states | Yes | No | No | No |
| Keyboard nav | Full | Limited | Limited | Optional |
| Chamfer method | CSS clip-path | SVG Polygon | Custom Path | CSS clip-path |
| Screen size | Variable | 320-428px | 320-428px | 1920x1080 |

---

## Web Platform

### Installation

Import platform styles after base tokens:

```html
<link rel="stylesheet" href="/src/styles/base.css">
<link rel="stylesheet" href="/src/styles/platforms/index.css">
```

Or in CSS:

```css
@import './styles/base.css';
@import './styles/platforms/index.css';
```

### Usage

Add platform class to root element:

```html
<body class="platform-web">
  <!-- Your app -->
</body>
```

### Features

**Responsive Breakpoints:**
- Mobile: < 640px
- Tablet: 640px - 1024px
- Desktop: > 1024px

**Hover States:**
- Automatically enabled only on devices with fine pointer (mouse)
- Touch devices won't trigger hover states

**Keyboard Navigation:**
- Focus-visible for keyboard users
- No focus ring for mouse clicks

**Container Layouts:**
```html
<div class="container-web">
  <!-- Max width 1280px, responsive padding -->
</div>
```

**Responsive Grid:**
```html
<div class="grid-responsive">
  <!-- 1 col mobile, 2 col tablet, 3 col desktop -->
</div>
```

---

## React Native Platform

### Installation

```bash
npm install react-native-svg
```

### Usage

Import tokens:

```typescript
import { tokens, getChamferPoints } from './src/platforms/react-native/tokens';

// Use tokens
const styles = StyleSheet.create({
  container: {
    backgroundColor: tokens.colors.bgPrimary,
    padding: tokens.spacing[4],
  },
  heading: {
    fontFamily: tokens.typography.fontDisplay,
    fontSize: tokens.typography.text2xl,
    fontWeight: tokens.typography.weightBold,
    color: tokens.colors.textPrimary,
  },
});
```

### Chamfered Components

Create chamfered shapes using SVG:

```typescript
import Svg, { Polygon } from 'react-native-svg';
import { getChamferPoints } from './src/platforms/react-native/tokens';

const ChamferedCard = ({ width, height, children }) => {
  const points = getChamferPoints(width, height, tokens.shapes.chamferLg);

  return (
    <View style={{ width, height }}>
      <Svg width={width} height={height} style={StyleSheet.absoluteFill}>
        <Polygon
          points={points}
          fill={tokens.colors.bgSecondary}
          stroke={tokens.colors.borderDefault}
          strokeWidth={tokens.shapes.borderWidthMd}
        />
      </Svg>
      <View style={styles.content}>{children}</View>
    </View>
  );
};
```

### Shadows

Apply platform-appropriate shadows:

```typescript
const styles = StyleSheet.create({
  card: {
    ...tokens.shadows.md,
    // Applies both iOS shadow and Android elevation
  },
});
```

---

## Flutter Platform

### Installation

Add fonts to `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: Inter
      fonts:
        - asset: fonts/Inter-Regular.ttf
        - asset: fonts/Inter-Bold.ttf
          weight: 700
    - family: JetBrainsMono
      fonts:
        - asset: fonts/JetBrainsMono-Medium.ttf
          weight: 500
```

### Usage

Import tokens:

```dart
import 'package:your_app/src/platforms/flutter/tokens.dart';

// Use tokens
Container(
  color: AppTokens.bgPrimary,
  padding: EdgeInsets.all(AppTokens.space4),
  child: Text(
    'Hello World',
    style: AppTokens.heading1(),
  ),
);
```

### Chamfered Components

Use ChamferedBorder for shapes:

```dart
Container(
  width: 200,
  height: 120,
  decoration: ShapeDecoration(
    color: AppTokens.bgSecondary,
    shape: ChamferedBorder(
      chamfer: AppTokens.chamferLg,
      borderColor: AppTokens.borderDefault,
      borderWidth: AppTokens.borderWidthMd,
    ),
  ),
  child: Center(child: Text('Chamfered Card')),
);
```

### Text Styles

Predefined text styles:

```dart
Text('Main Heading', style: AppTokens.heading1()),
Text('Subheading', style: AppTokens.heading2()),
Text('Body text', style: AppTokens.bodyBase()),
Text('Label', style: AppTokens.label()),
Text('CODE-123', style: AppTokens.mono(fontSize: 14)),
```

---

## HMI Kiosk Platform

### Target Hardware

- 21.5" 1080p touchscreen (1920x1080)
- Viewing distance: 50-100cm
- Touch-based interaction
- Bright ambient lighting

### Installation

Same as web platform:

```html
<link rel="stylesheet" href="/src/styles/base.css">
<link rel="stylesheet" href="/src/styles/platforms/index.css">
```

### Usage

Add kiosk platform class:

```html
<body class="platform-kiosk">
  <div class="kiosk-layout">
    <header class="kiosk-header">
      <!-- Branding, time, status -->
    </header>

    <main class="kiosk-content">
      <!-- Main interaction area -->
    </main>

    <footer class="kiosk-hardware-zone">
      <!-- Hardware indicators: NFC, card reader, printer -->
    </footer>
  </div>
</body>
```

### Components

**Kiosk Buttons (82px minimum):**
```html
<button class="btn-kiosk btn-kiosk-primary">
  START WASH
</button>

<button class="btn-kiosk btn-kiosk-wash">
  WASH + DRY
</button>
```

**Kiosk Cards:**
```html
<div class="card-kiosk card-kiosk-selectable">
  <h3 class="kiosk-heading-3">Premium Package</h3>
  <p class="kiosk-body">Deep clean + fabric protection</p>
  <p class="kiosk-price">150,000₫</p>
</div>
```

**Grid Layouts:**
```html
<!-- 2 columns for machine selection -->
<div class="kiosk-grid kiosk-grid-2">
  <div class="card-kiosk">Machine A1</div>
  <div class="card-kiosk">Machine A2</div>
</div>

<!-- 3 columns for payment options -->
<div class="kiosk-grid kiosk-grid-3">
  <button class="btn-kiosk">Cash</button>
  <button class="btn-kiosk">Card</button>
  <button class="btn-kiosk">QR Code</button>
</div>
```

### High Contrast Mode

For bright ambient lighting:

```html
<body class="platform-kiosk kiosk-high-contrast">
  <!-- 7:1 contrast ratio, thicker borders -->
</body>
```

---

## Design Principles

### Cohesion Over Consistency

Platforms use native conventions while maintaining brand identity:

- **Web:** Hover states, keyboard navigation, responsive layouts
- **Mobile:** Touch gestures, safe areas, native feedback
- **Kiosk:** Large targets, distance viewing, hardware integration

### Touch Target Minimums

- **Mobile:** 44px (iOS/Android standard)
- **Kiosk:** 82px (industrial HMI standard)
- **Spacing:** Minimum 21px between kiosk targets

### Typography Scale

Adjusted per platform viewing distance:

- **Web/Mobile:** 16px base (30cm viewing)
- **Kiosk:** 20px base (50-100cm viewing)

### Chamfered Corners

Industrial/tactical aesthetic with 45° cut corners:

- **Web:** CSS clip-path
- **React Native:** SVG polygon
- **Flutter:** Custom ShapeBorder
- **Kiosk:** CSS clip-path (larger chamfers)

---

## Best Practices

### Platform Detection

Detect platform and apply appropriate class:

```javascript
// Web detection
const platform = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent)
  ? 'mobile'
  : 'web';

document.body.classList.add(`platform-${platform}`);
```

### Token Usage

Always use tokens instead of hardcoded values:

```typescript
// Good
backgroundColor: tokens.colors.bgPrimary

// Bad
backgroundColor: '#f0f2f5'
```

### Accessibility

- **Web:** Full keyboard navigation with focus-visible
- **Mobile:** VoiceOver/TalkBack support, 44px targets
- **Kiosk:** High contrast mode, 82px targets, clear labels

### Testing Checklist

- [ ] Touch targets meet platform minimums
- [ ] Text readable at target viewing distance
- [ ] Chamfered shapes render correctly
- [ ] Hover states work only on capable devices
- [ ] Colors meet WCAG AA contrast requirements
- [ ] Safe areas respected on mobile
- [ ] Hardware zones visible on kiosk

---

## Resources

- **Web Styles:** `src/styles/platforms/web.css`
- **Kiosk Styles:** `src/styles/platforms/kiosk.css`
- **React Native Tokens:** `src/platforms/react-native/tokens.ts`
- **Flutter Tokens:** `src/platforms/flutter/tokens.dart`
- **Demo:** `src/kiosk-demo.html` (kiosk layout example)

---

## Support

For platform-specific questions or issues, refer to:

- Phase 03 documentation: `plans/20251212-the-clean-lab-brand-guidelines/phase-03-platform-adaptations.md`
- Design system research: `plans/20251212-the-clean-lab-brand-guidelines/research/`
