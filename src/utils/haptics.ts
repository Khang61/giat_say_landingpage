/**
 * Haptic Feedback Utility - The Clean Lab
 * "Titanium Command" Industrial/Tactical Design System
 *
 * Provides tactile feedback patterns for physical device interactions
 * Uses Web Vibration API with graceful fallback
 */

/**
 * Check if vibration API is supported
 */
const isVibrationSupported = (): boolean => {
  return 'vibrate' in navigator;
};

/**
 * Safe vibration wrapper with fallback
 */
const vibrate = (pattern: number | number[]): void => {
  if (isVibrationSupported()) {
    navigator.vibrate(pattern);
  }
};

/**
 * Haptic feedback patterns for various interactions
 */
export const haptics = {
  /**
   * Light tap - for selection, toggle, and minor interactions
   * Duration: 10ms
   * Use: Radio buttons, checkboxes, switches
   */
  light: (): void => {
    vibrate(10);
  },

  /**
   * Medium tap - for button presses and confirmations
   * Duration: 20ms
   * Use: Primary buttons, confirmation actions
   */
  medium: (): void => {
    vibrate(20);
  },

  /**
   * Heavy tap - for important actions
   * Duration: 30ms
   * Use: Destructive actions, final confirmations
   */
  heavy: (): void => {
    vibrate(30);
  },

  /**
   * Success - double pulse for successful completion
   * Pattern: [10ms, 50ms pause, 10ms]
   * Use: Transaction success, payment complete, task done
   */
  success: (): void => {
    vibrate([10, 50, 10]);
  },

  /**
   * Error - triple pulse for rejection or failure
   * Pattern: [30ms, 50ms pause, 30ms, 50ms pause, 30ms]
   * Use: Payment declined, invalid input, operation failed
   */
  error: (): void => {
    vibrate([30, 50, 30, 50, 30]);
  },

  /**
   * Warning - double medium pulse
   * Pattern: [20ms, 40ms pause, 20ms]
   * Use: Low balance warning, timeout warning
   */
  warning: (): void => {
    vibrate([20, 40, 20]);
  },

  /**
   * NFC read success - quick ascending pattern
   * Pattern: [10ms, 30ms pause, 20ms]
   * Use: Card detected, NFC tag read
   */
  nfcSuccess: (): void => {
    vibrate([10, 30, 20]);
  },

  /**
   * Card insert - sustained pulse
   * Pattern: [15ms, 30ms pause, 25ms]
   * Use: Physical card insertion detected
   */
  cardInsert: (): void => {
    vibrate([15, 30, 25]);
  },

  /**
   * Card eject - quick descending pattern
   * Pattern: [20ms, 30ms pause, 10ms]
   * Use: Card ejected from slot
   */
  cardEject: (): void => {
    vibrate([20, 30, 10]);
  },

  /**
   * Bill accepted - triple quick pulse
   * Pattern: [15ms, 20ms pause, 15ms, 20ms pause, 15ms]
   * Use: Cash bill accepted by acceptor
   */
  billAccepted: (): void => {
    vibrate([15, 20, 15, 20, 15]);
  },

  /**
   * Processing - subtle ongoing pulse
   * Pattern: [10ms, 100ms pause, 10ms, 100ms pause, 10ms]
   * Use: Transaction processing, waiting for response
   */
  processing: (): void => {
    vibrate([10, 100, 10, 100, 10]);
  },

  /**
   * Navigation - single subtle pulse
   * Duration: 5ms
   * Use: Page transitions, screen changes
   */
  navigation: (): void => {
    vibrate(5);
  },

  /**
   * Cancel/Stop all vibrations
   * Use: When user cancels action or leaves screen
   */
  stop: (): void => {
    vibrate(0);
  },
};

/**
 * Check if haptics are available
 */
export const hapticsAvailable = isVibrationSupported;

/**
 * Default export
 */
export default haptics;
