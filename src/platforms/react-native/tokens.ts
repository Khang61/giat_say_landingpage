/**
 * React Native Token Mapping - The Clean Lab
 * "Titanium Command" Industrial/Tactical Design System
 *
 * Token mapping for React Native mobile apps.
 * All values converted to RN-compatible formats.
 */

export const tokens = {
  /* ========================================
     COLORS
     ======================================== */
  colors: {
    // Neutrals
    white: '#ffffff',
    gray50: '#f8fafc',
    gray100: '#f0f2f5',
    gray200: '#e2e8f0',
    gray300: '#cbd5e1',
    gray400: '#94a3b8',
    gray500: '#64748b',
    gray900: '#0f172a',
    black: '#111111',

    // Brand
    blue500: '#0055ff',
    blue600: '#0044cc',
    orange500: '#ff4800',
    orange600: '#e04000',

    // Status
    green500: '#00cc66',
    red500: '#ff3333',
    amber500: '#ffaa00',

    // Semantic - Background
    bgPrimary: '#f0f2f5',
    bgSecondary: '#ffffff',
    bgTertiary: '#f8fafc',

    // Semantic - Text
    textPrimary: '#111111',
    textSecondary: '#64748b',
    textMuted: '#94a3b8',
    textInverse: '#ffffff',

    // Semantic - Accent
    accentPrimary: '#0055ff',
    accentPrimaryHover: '#0044cc',
    accentWash: '#0055ff',
    accentDry: '#ff4800',

    // Semantic - Border
    borderSubtle: '#e2e8f0',
    borderDefault: '#cbd5e1',
    borderStrong: '#94a3b8',

    // Semantic - Status
    statusSuccess: '#00cc66',
    statusSuccessBg: '#e6f9f0',
    statusSuccessText: '#006633',
    statusError: '#ff3333',
    statusErrorBg: '#ffebe6',
    statusErrorText: '#cc0000',
    statusWarning: '#ffaa00',
    statusWarningBg: '#fff8e6',
    statusWarningText: '#cc8800',
  },

  /* ========================================
     SPACING (in pixels for RN)
     ======================================== */
  spacing: {
    0: 0,
    1: 4,
    2: 8,
    3: 12,
    4: 16,
    5: 20,
    6: 24,
    8: 32,
    10: 40,
    12: 48,
    16: 64,
    20: 80,
    24: 96,
    32: 128,
  },

  /* ========================================
     TYPOGRAPHY
     ======================================== */
  typography: {
    // Font families
    fontDisplay: 'Inter',
    fontMono: 'JetBrainsMono',

    // Font sizes (in pixels)
    textXs: 12,
    textSm: 14,
    textBase: 16,
    textLg: 18,
    textXl: 20,
    text2xl: 24,
    text3xl: 30,
    text4xl: 36,

    // Font weights
    weightRegular: '400',
    weightMedium: '500',
    weightSemibold: '600',
    weightBold: '700',
    weightExtrabold: '800',
    weightBlack: '900',

    // Line heights (unitless multiplier for RN)
    leadingTight: 1.1,
    leadingSnug: 1.25,
    leadingNormal: 1.5,
    leadingRelaxed: 1.625,

    // Letter spacing (in pixels)
    trackingTight: -0.4,
    trackingNormal: 0,
    trackingWide: 0.8,
    trackingWidest: 1.6,
  },

  /* ========================================
     SHAPES - Chamfer values for SVG drawing
     ======================================== */
  shapes: {
    // Chamfer sizes (for polygon path calculation)
    chamferSm: 8,
    chamferMd: 12,
    chamferLg: 20,
    chamferXl: 30,

    // Border widths
    borderWidthSm: 1,
    borderWidthMd: 2,
    borderWidthLg: 3,
    borderWidthXl: 4,

    // Border radius (for fallback if SVG not used)
    radiusNone: 0, // Use chamfers instead
  },

  /* ========================================
     SHADOWS (iOS/Android elevation)
     ======================================== */
  shadows: {
    sm: {
      shadowColor: '#000000',
      shadowOffset: { width: 0, height: 1 },
      shadowOpacity: 0.05,
      shadowRadius: 2,
      elevation: 1,
    },
    md: {
      shadowColor: '#000000',
      shadowOffset: { width: 0, height: 4 },
      shadowOpacity: 0.07,
      shadowRadius: 6,
      elevation: 3,
    },
    lg: {
      shadowColor: '#000000',
      shadowOffset: { width: 0, height: 10 },
      shadowOpacity: 0.1,
      shadowRadius: 15,
      elevation: 6,
    },
    xl: {
      shadowColor: '#000000',
      shadowOffset: { width: 0, height: 20 },
      shadowOpacity: 0.15,
      shadowRadius: 25,
      elevation: 10,
    },
  },

  /* ========================================
     TOUCH TARGETS (Mobile-specific)
     ======================================== */
  touch: {
    minTargetSize: 44, // iOS/Android minimum
    recommendedSpacing: 8,
  },

  /* ========================================
     ANIMATIONS
     ======================================== */
  animations: {
    durationFast: 150,
    durationNormal: 200,
    durationSlow: 300,
    easingStandard: 'ease-in-out',
  },
};

/* ========================================
   HELPER FUNCTION: Generate chamfer polygon points
   ======================================== */

export function getChamferPoints(
  width: number,
  height: number,
  chamfer: number
): string {
  return `
    ${chamfer},0
    ${width},0
    ${width},${height - chamfer}
    ${width - chamfer},${height}
    0,${height}
    0,${chamfer}
  `.trim();
}

/* ========================================
   TYPE EXPORTS
   ======================================== */

export type Tokens = typeof tokens;
export type ColorKey = keyof typeof tokens.colors;
export type SpacingKey = keyof typeof tokens.spacing;
export type TypographyKey = keyof typeof tokens.typography;
export type ShapeKey = keyof typeof tokens.shapes;
