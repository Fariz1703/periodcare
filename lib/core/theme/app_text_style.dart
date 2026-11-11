import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  // Private constructor to prevent instantiation
  AppTypography._();

  // Font Family Base
  static final TextStyle _base = GoogleFonts.plusJakartaSans();

  // Default neutral text colors
  static const Color textPrimary = Color(0xFF1C1B1A);   // WCAG AAA high contrast
  static const Color textSecondary = Color(0xFF6B6562); // Muted body & captions
  static const Color textTertiary = Color(0xFF9E9794);  // Placeholders / hints

  // ===========================================================================
  // DISPLAY / HERO COUNTERS
  // Digunakan untuk: Angka ritme siklus ("Hari ke-14", "2 Hari Menuju Haid")
  // ===========================================================================

  /// Display Large: 32px | LH: 40px (1.25) | Bold 700
  static TextStyle displayLarge = _base.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 40 / 32, // 1.25
    letterSpacing: -0.5,
    color: textPrimary,
  );

  /// Display Medium: 28px | LH: 36px (1.28) | Bold 700
  static TextStyle displayMedium = _base.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 36 / 28,
    letterSpacing: -0.3,
    color: textPrimary,
  );

  // ===========================================================================
  // HEADINGS
  // Digunakan untuk: Judul layar utama, header seksi, judul modal
  // ===========================================================================

  /// Heading 1: 24px | LH: 32px (1.33) | Bold 700
  /// Judul layar utama (AppBar / Hero Title)
  static TextStyle heading1 = _base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
    letterSpacing: -0.3,
    color: textPrimary,
  );

  /// Heading 2: 20px | LH: 28px (1.40) | SemiBold 600
  /// Judul kartu (Card Header) & sub-seksi dashboard
  static TextStyle heading2 = _base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
    letterSpacing: -0.2,
    color: textPrimary,
  );

  /// Heading 3: 18px | LH: 24px (1.33) | SemiBold 600
  /// Judul item riwayat siklus & dialog konfirmasi
  static TextStyle heading3 = _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
    letterSpacing: -0.1,
    color: textPrimary,
  );

  // ===========================================================================
  // BODY TEXT
  // Digunakan untuk: Deskripsi panduan medis, teks input, artikel kesehatan
  // ===========================================================================

  /// Body Large: 16px | LH: 24px (1.50) | Regular 400
  /// Paragraf teks utama / penjelasan tips kesehatan
  static TextStyle bodyLarge = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    letterSpacing: 0.1,
    color: textPrimary,
  );

  /// Body Large Medium: 16px | LH: 24px (1.50) | Medium 500
  /// Input form text field aktif & opsi terpilih
  static TextStyle bodyLargeMedium = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    letterSpacing: 0.1,
    color: textPrimary,
  );

  /// Body Medium: 14px | LH: 20px (1.43) | Regular 400
  /// Deskripsi sekunder & isi item ringkasan
  static TextStyle bodyMedium = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    letterSpacing: 0.1,
    color: textSecondary,
  );

  /// Body Medium SemiBold: 14px | LH: 20px (1.43) | SemiBold 600
  /// Tanggal kalender aktif & nama metrik statistik
  static TextStyle bodyMediumSemiBold = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.1,
    color: textPrimary,
  );

  /// Body Small: 13px | LH: 18px (1.38) | Regular 400
  /// Sub-keterangan prediksi, catatan kaki, & petunjuk input
  static TextStyle bodySmall = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    height: 18 / 13,
    letterSpacing: 0.1,
    color: textSecondary,
  );

  // ===========================================================================
  // BUTTONS & ACTIONS
  // Digunakan untuk: Tombol 56px CTA, Pill, Chip seleksi, Action Snackbar
  // ===========================================================================

  /// Button Large (Primary 56px CTA): 16px | LH: 24px | Bold 700
  static TextStyle buttonLarge = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 24 / 16,
    letterSpacing: 0.2,
    color: Colors.white,
  );

  /// Button Medium: 14px | LH: 20px | SemiBold 600
  /// Tombol sekunder (Outline / Ghost button)
  static TextStyle buttonMedium = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.1,
    color: const Color(0xFF8A2846),
  );

  /// Action Undo / Snackbar: 13px | LH: 18px | Bold 700
  /// Teks tombol "BATALKAN" pada snackbar 4-detik
  static TextStyle snackbarAction = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 18 / 13,
    letterSpacing: 0.5,
    color: const Color(0xFFFFD9DF),
  );

  /// Chip Label (SymptomChip): 13px | LH: 18px | Medium 500
  static TextStyle chipLabel = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 18 / 13,
    letterSpacing: 0.1,
    color: textPrimary,
  );

  // ===========================================================================
  // LABELS, BADGES & OVERLINES
  // Digunakan untuk: Status fase haid, badge ovulasi, nama hari kalender
  // ===========================================================================

  /// Badge / Pill Status: 11px | LH: 14px (1.27) | SemiBold 600
  /// Contoh: "FASE AKTIF", "MASA SUBUR", "NORMAL"
  static TextStyle badge = _base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 14 / 11,
    letterSpacing: 0.4,
  );

  /// Calendar Day Header: 12px | LH: 16px | SemiBold 600
  /// Singkatan hari: MIN, SEN, SEL, RAB, KAM, JUM, SAB
  static TextStyle calendarHeader = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.5,
    color: textTertiary,
  );

  /// Overline / Section Tag: 11px | LH: 14px | Bold 700 | All Caps
  /// Contoh: "JURNAL & KALENDER", "RINGKASAN MEDIS"
  static TextStyle overline = _base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    height: 14 / 11,
    letterSpacing: 0.8,
    color: const Color(0xFF8A2846),
  );
}