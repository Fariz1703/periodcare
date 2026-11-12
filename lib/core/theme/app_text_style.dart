
import 'package:flutter/material.dart';

class AppTypography {
  // Private constructor to prevent instantiation
  AppTypography._();

  // Font Family Base (Local Font)
  static const TextStyle _base = TextStyle(
    fontFamily: 'PlusJakartaSans',
  );

  // Default neutral text colors
  static const Color textPrimary = Color(0xFF1C1B1A);
  static const Color textSecondary = Color(0xFF6B6562);
  static const Color textTertiary = Color(0xFF9E9794);

  // ===========================================================================
  // DISPLAY / HERO COUNTERS
  // ===========================================================================

  static final TextStyle displayLarge = _base.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 40 / 32,
    letterSpacing: -0.5,
    color: textPrimary,
  );

  static final TextStyle displayMedium = _base.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 36 / 28,
    letterSpacing: -0.3,
    color: textPrimary,
  );

  // ===========================================================================
  // HEADINGS
  // ===========================================================================

  static final TextStyle heading1 = _base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
    letterSpacing: -0.3,
    color: textPrimary,
  );

  static final TextStyle heading2 = _base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
    letterSpacing: -0.2,
    color: textPrimary,
  );

  static final TextStyle heading3 = _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
    letterSpacing: -0.1,
    color: textPrimary,
  );

  // ===========================================================================
  // BODY TEXT
  // ===========================================================================

  static final TextStyle bodyLarge = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    letterSpacing: 0.1,
    color: textPrimary,
  );

  static final TextStyle bodyLargeMedium = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    letterSpacing: 0.1,
    color: textPrimary,
  );

  static final TextStyle bodyMedium = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    letterSpacing: 0.1,
    color: textSecondary,
  );

  static final TextStyle bodyMediumSemiBold = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.1,
    color: textPrimary,
  );

  static final TextStyle bodySmall = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 18 / 13,
    letterSpacing: 0.1,
    color: textSecondary,
  );

  // ===========================================================================
  // BUTTONS & ACTIONS
  // ===========================================================================

  static final TextStyle buttonLarge = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 24 / 16,
    letterSpacing: 0.2,
    color: Colors.white,
  );

  static final TextStyle buttonMedium = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.1,
    color: const Color(0xFF8A2846),
  );

  static final TextStyle snackbarAction = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 18 / 13,
    letterSpacing: 0.5,
    color: const Color(0xFFFFD9DF),
  );

  static final TextStyle chipLabel = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 18 / 13,
    letterSpacing: 0.1,
    color: textPrimary,
  );

  // ===========================================================================
  // LABELS, BADGES & OVERLINES
  // ===========================================================================

  static final TextStyle badge = _base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 14 / 11,
    letterSpacing: 0.4,
  );

  static final TextStyle calendarHeader = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.5,
    color: textTertiary,
  );

  static final TextStyle overline = _base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    height: 14 / 11,
    letterSpacing: 0.8,
    color: const Color(0xFF8A2846),
  );
}
