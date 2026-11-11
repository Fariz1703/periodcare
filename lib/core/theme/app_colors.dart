import 'package:flutter/material.dart';

class AppColors {
  // Brand & Primary
  static const Color primary = Color(0xFF8A2846); // Warm Deep Berry (Aksen utama, CTA)
  static const Color primaryContainer = Color(0xFFFFD9DF); // Soft Pink Container
  static const Color onPrimary = Color(0xFFFFFFFF); // Text/Icon on Primary
  static const Color onPrimaryContainer = Color(0xFF3B0718); // Dark berry for container text

  // Secondary & Accents
  static const Color secondary = Color(0xFFFFD9DF); // Soft Blush Pink
  static const Color secondaryDark = Color(0xFFB3395B); // Berry Accent
  static const Color onSecondary = Color(0xFF1C1B1A);

  // Semantik Siklus Haid (Menstrual Cycle Tokens)
  static const Color periodActive = Color(0xFF8A2846); // Fase Haid Aktif (Deep Berry)
  static const Color periodBand = Color(0xFFFFE4E8); // Background rentang tanggal kalender
  static const Color fertile = Color(0xFFE27D60); // Masa Subur / Ovulasi (Warm Terracotta / Peach)
  static const Color fertileLight = Color(0xFFFFECE5); // Background chip masa subur
  static const Color luteal = Color(0xFFC38D9E); // Fase Luteal (Muted Mauve)
  static const Color success = Color(0xFF2E7D32); // Sukses / Tepat Waktu (Forest Green)
  static const Color successContainer = Color(0xFFE8F5E9);
  static const Color warning = Color(0xFFED6C02); // Perhatian / Terlambat
  static const Color warningContainer = Color(0xFFFFF3E0);

  // Background & Surfaces
  static const Color surface = Color(0xFFFDF8F5); // Warm Calming Cream (Canvas dasar)
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF); // Pure White Card
  static const Color surfaceContainerLow = Color(0xFFF8F3F0); // Light Neutral Card
  static const Color surfaceContainer = Color(0xFFF3EDE9); // Card default / Chip background
  static const Color surfaceContainerHigh = Color(0xFFEEE7E3); // Card Hover / Active
  static const Color surfaceDim = Color(0xFFDED9D6); // Disabled / Muted surface

  // Outline & Borders
  static const Color outline = Color(0xFFE6DCD7); // Border halus kartu & input
  static const Color outlineVariant = Color(0xFFF0E7E3); // Divider sangat halus

  // Typography & Content
  static const Color textPrimary = Color(0xFF1C1B1A); // High Contrast Text (Near Black warm)
  static const Color textSecondary = Color(0xFF6B6562); // Medium Muted Text / Subtitle
  static const Color textTertiary = Color(0xFF9E9794); // Hint / Placeholder / Disabled Text
}