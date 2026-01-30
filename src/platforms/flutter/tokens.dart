/**
 * Flutter Token Mapping - The Clean Lab
 * "Titanium Command" Industrial/Tactical Design System
 *
 * Token mapping for Flutter mobile apps.
 * All values converted to Flutter-compatible formats.
 */

import 'package:flutter/material.dart';

class AppTokens {
  /* ========================================
     COLORS
     ======================================== */

  // Neutrals
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray50 = Color(0xFFF8FAFC);
  static const Color gray100 = Color(0xFFF0F2F5);
  static const Color gray200 = Color(0xFFE2E8F0);
  static const Color gray300 = Color(0xFFCBD5E1);
  static const Color gray400 = Color(0xFF94A3B8);
  static const Color gray500 = Color(0xFF64748B);
  static const Color gray900 = Color(0xFF0F172A);
  static const Color black = Color(0xFF111111);

  // Brand
  static const Color blue500 = Color(0xFF0055FF);
  static const Color blue600 = Color(0xFF0044CC);
  static const Color orange500 = Color(0xFFFF4800);
  static const Color orange600 = Color(0xFFE04000);

  // Status
  static const Color green500 = Color(0xFF00CC66);
  static const Color red500 = Color(0xFFFF3333);
  static const Color amber500 = Color(0xFFFFAA00);

  // Semantic - Background
  static const Color bgPrimary = gray100;
  static const Color bgSecondary = white;
  static const Color bgTertiary = gray50;

  // Semantic - Text
  static const Color textPrimary = black;
  static const Color textSecondary = gray500;
  static const Color textMuted = gray400;
  static const Color textInverse = white;

  // Semantic - Accent
  static const Color accentPrimary = blue500;
  static const Color accentPrimaryHover = blue600;
  static const Color accentWash = blue500;
  static const Color accentDry = orange500;

  // Semantic - Border
  static const Color borderSubtle = gray200;
  static const Color borderDefault = gray300;
  static const Color borderStrong = gray400;

  // Semantic - Status
  static const Color statusSuccess = green500;
  static const Color statusSuccessBg = Color(0xFFE6F9F0);
  static const Color statusSuccessText = Color(0xFF006633);
  static const Color statusError = red500;
  static const Color statusErrorBg = Color(0xFFFFEBE6);
  static const Color statusErrorText = Color(0xFFCC0000);
  static const Color statusWarning = amber500;
  static const Color statusWarningBg = Color(0xFFFFF8E6);
  static const Color statusWarningText = Color(0xFFCC8800);

  /* ========================================
     SPACING
     ======================================== */

  static const double space0 = 0;
  static const double space1 = 4;
  static const double space2 = 8;
  static const double space3 = 12;
  static const double space4 = 16;
  static const double space5 = 20;
  static const double space6 = 24;
  static const double space8 = 32;
  static const double space10 = 40;
  static const double space12 = 48;
  static const double space16 = 64;
  static const double space20 = 80;
  static const double space24 = 96;
  static const double space32 = 128;

  /* ========================================
     TYPOGRAPHY
     ======================================== */

  // Font families
  static const String fontDisplay = 'Inter';
  static const String fontMono = 'JetBrainsMono';

  // Font sizes
  static const double textXs = 12;
  static const double textSm = 14;
  static const double textBase = 16;
  static const double textLg = 18;
  static const double textXl = 20;
  static const double text2xl = 24;
  static const double text3xl = 30;
  static const double text4xl = 36;

  // Font weights
  static const FontWeight weightRegular = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightSemibold = FontWeight.w600;
  static const FontWeight weightBold = FontWeight.w700;
  static const FontWeight weightExtrabold = FontWeight.w800;
  static const FontWeight weightBlack = FontWeight.w900;

  // Line heights (as height multiplier)
  static const double leadingTight = 1.1;
  static const double leadingSnug = 1.25;
  static const double leadingNormal = 1.5;
  static const double leadingRelaxed = 1.625;

  // Letter spacing
  static const double trackingTight = -0.4;
  static const double trackingNormal = 0;
  static const double trackingWide = 0.8;
  static const double trackingWidest = 1.6;

  /* ========================================
     SHAPES
     ======================================== */

  // Chamfer sizes (for custom shape drawing)
  static const double chamferSm = 8;
  static const double chamferMd = 12;
  static const double chamferLg = 20;
  static const double chamferXl = 30;

  // Border widths
  static const double borderWidthSm = 1;
  static const double borderWidthMd = 2;
  static const double borderWidthLg = 3;
  static const double borderWidthXl = 4;

  /* ========================================
     SHADOWS
     ======================================== */

  static const List<BoxShadow> shadowSm = [
    BoxShadow(
      color: Color(0x0D000000), // 5% opacity
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  static const List<BoxShadow> shadowMd = [
    BoxShadow(
      color: Color(0x12000000), // 7% opacity
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
  ];

  static const List<BoxShadow> shadowLg = [
    BoxShadow(
      color: Color(0x1A000000), // 10% opacity
      offset: Offset(0, 10),
      blurRadius: 15,
    ),
  ];

  static const List<BoxShadow> shadowXl = [
    BoxShadow(
      color: Color(0x26000000), // 15% opacity
      offset: Offset(0, 20),
      blurRadius: 25,
    ),
  ];

  // Tactical glows
  static const List<BoxShadow> glowBlue = [
    BoxShadow(
      color: Color(0x4D0055FF), // 30% opacity
      blurRadius: 20,
    ),
  ];

  static const List<BoxShadow> glowOrange = [
    BoxShadow(
      color: Color(0x4DFF4800), // 30% opacity
      blurRadius: 20,
    ),
  ];

  /* ========================================
     TOUCH TARGETS
     ======================================== */

  static const double minTargetSize = 44;
  static const double recommendedSpacing = 8;

  /* ========================================
     ANIMATIONS
     ======================================== */

  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 200);
  static const Duration durationSlow = Duration(milliseconds: 300);

  static const Curve easingStandard = Curves.easeInOut;

  /* ========================================
     HELPER: Text Styles
     ======================================== */

  static TextStyle heading1({Color? color}) => TextStyle(
        fontFamily: fontDisplay,
        fontSize: text4xl,
        fontWeight: weightBlack,
        height: leadingTight,
        letterSpacing: trackingTight,
        color: color ?? textPrimary,
      );

  static TextStyle heading2({Color? color}) => TextStyle(
        fontFamily: fontDisplay,
        fontSize: text3xl,
        fontWeight: weightExtrabold,
        height: leadingSnug,
        letterSpacing: trackingTight,
        color: color ?? textPrimary,
      );

  static TextStyle heading3({Color? color}) => TextStyle(
        fontFamily: fontDisplay,
        fontSize: text2xl,
        fontWeight: weightBold,
        height: leadingSnug,
        color: color ?? textPrimary,
      );

  static TextStyle bodyBase({Color? color}) => TextStyle(
        fontFamily: fontDisplay,
        fontSize: textBase,
        fontWeight: weightRegular,
        height: leadingNormal,
        color: color ?? textPrimary,
      );

  static TextStyle bodyLarge({Color? color}) => TextStyle(
        fontFamily: fontDisplay,
        fontSize: textLg,
        fontWeight: weightRegular,
        height: leadingNormal,
        color: color ?? textPrimary,
      );

  static TextStyle label({Color? color}) => TextStyle(
        fontFamily: fontDisplay,
        fontSize: textSm,
        fontWeight: weightSemibold,
        letterSpacing: trackingWide,
        color: color ?? textMuted,
      );

  static TextStyle mono({Color? color, double? fontSize}) => TextStyle(
        fontFamily: fontMono,
        fontSize: fontSize ?? textBase,
        fontWeight: weightMedium,
        color: color ?? textPrimary,
      );
}

/* ========================================
   CUSTOM CHAMFERED BORDER SHAPE
   ======================================== */

class ChamferedBorder extends ShapeBorder {
  final double chamfer;
  final Color borderColor;
  final double borderWidth;

  const ChamferedBorder({
    this.chamfer = 20,
    this.borderColor = Colors.black,
    this.borderWidth = 2,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(borderWidth);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(
      rect.deflate(borderWidth),
      textDirection: textDirection,
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.left + chamfer, rect.top)
      ..lineTo(rect.right, rect.top)
      ..lineTo(rect.right, rect.bottom - chamfer)
      ..lineTo(rect.right - chamfer, rect.bottom)
      ..lineTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top + chamfer)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return ChamferedBorder(
      chamfer: chamfer * t,
      borderColor: borderColor,
      borderWidth: borderWidth * t,
    );
  }
}
