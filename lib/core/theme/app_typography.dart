import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Typography definitions for Obsidian Lumina powered by Plus Jakarta Sans.
abstract final class AppTypography {
  // ---------------------------------------------------------
  // Headline & Marquee Styles
  // ---------------------------------------------------------
  /// 40px, w800, line-height: 48px, tracking: -0.03em
  static TextStyle headlineXl = GoogleFonts.plusJakartaSans(
    fontSize: 40,
    fontWeight: FontWeight.w800,
    height: 48 / 40,
    letterSpacing: -1.2,
    color: AppColors.textPrimary,
  );

  /// 30px, w800, line-height: 36px, tracking: -0.025em (Mobile hero titles)
  static TextStyle headlineXlMobile = GoogleFonts.plusJakartaSans(
    fontSize: 30,
    fontWeight: FontWeight.w800,
    height: 36 / 30,
    letterSpacing: -0.75,
    color: AppColors.textPrimary,
  );

  /// 32px, w700, line-height: 40px, tracking: -0.02em
  static TextStyle headlineLg = GoogleFonts.plusJakartaSans(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 40 / 32,
    letterSpacing: -0.64,
    color: AppColors.textPrimary,
  );

  /// 24px, w700, line-height: 32px, tracking: -0.02em (Mobile section headers)
  static TextStyle headlineLgMobile = GoogleFonts.plusJakartaSans(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
    letterSpacing: -0.48,
    color: AppColors.textPrimary,
  );

  /// 20px, w700, line-height: 28px, tracking: -0.015em (Carousels & rails)
  static TextStyle headlineMd = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 28 / 20,
    letterSpacing: -0.3,
    color: AppColors.textPrimary,
  );

  // ---------------------------------------------------------
  // Title Styles
  // ---------------------------------------------------------
  /// 18px, w600, line-height: 24px
  static TextStyle titleLg = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
    color: AppColors.textPrimary,
  );

  /// 16px, w600, line-height: 22px (Card titles, cast names)
  static TextStyle titleMd = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 22 / 16,
    color: AppColors.textPrimary,
  );

  // ---------------------------------------------------------
  // Body Styles
  // ---------------------------------------------------------
  /// 16px, w400, line-height: 24px
  static TextStyle bodyLg = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: AppColors.textPrimary,
  );

  /// 14px, w400, line-height: 20px (Movie synopses, reviews)
  static TextStyle bodyMd = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    color: AppColors.textSecondary,
  );

  /// 12px, w400, line-height: 16px (Subtle meta, runtimes)
  static TextStyle bodySm = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    color: AppColors.textSubtle,
  );

  // ---------------------------------------------------------
  // Labels & Chips
  // ---------------------------------------------------------
  /// 13px, w600, line-height: 18px, tracking: 0.02em (Buttons & action pills)
  static TextStyle labelMd = GoogleFonts.plusJakartaSans(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 18 / 13,
    letterSpacing: 0.26,
    color: AppColors.textPrimary,
  );

  /// 11px, w700, line-height: 14px, tracking: 0.04em (Badges & tags)
  static TextStyle labelSm = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    height: 14 / 11,
    letterSpacing: 0.44,
    color: AppColors.textSecondary,
  );

  /// 12px, w800, line-height: 14px, tracking: -0.01em (Rotten / IMDb score badges)
  static TextStyle badgeScore = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w800,
    height: 14 / 12,
    letterSpacing: -0.12,
    color: AppColors.vividEmeraldLime,
  );

  /// Micro pill flags (4K, UHD, HDR10+, IMAX)
  static TextStyle qualityFlag = GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    height: 14 / 11,
    letterSpacing: 0.44,
    color: AppColors.textSecondary,
  );

  /// Full Material 3 [TextTheme] mapping.
  static TextTheme textTheme = TextTheme(
    displayLarge: headlineXl,
    displayMedium: headlineXlMobile,
    displaySmall: headlineLg,
    headlineLarge: headlineLg,
    headlineMedium: headlineLgMobile,
    headlineSmall: headlineMd,
    titleLarge: titleLg,
    titleMedium: titleMd,
    titleSmall: titleMd.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
    bodyLarge: bodyLg,
    bodyMedium: bodyMd,
    bodySmall: bodySm,
    labelLarge: labelMd.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
    labelMedium: labelMd,
    labelSmall: labelSm,
  );
}
