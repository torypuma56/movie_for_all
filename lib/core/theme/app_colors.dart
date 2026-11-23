import 'package:flutter/material.dart';

/// Movie 4 All Color System
/// Rose & Gold palette derived from seed `#491E29`; obsidian canvas preserved.
abstract final class AppColors {
  // ---------------------------------------------------------
  // Brand & Accents
  // ---------------------------------------------------------
  /// Primary Rose (`#F2B8C6`): derived from seed `#491E29`, main actions.
  static const Color electricUltraviolet = Color(0xFFF2B8C6);

  /// Warm Gold (`#F3C969`): high-value ratings, VIP locks, downloads.
  static const Color vividEmeraldLime = Color(0xFFF3C969);

  /// Blush (`#E8A8B8`): ambient glow, hero gradient masks.
  static const Color brightHeliotrope = Color(0xFFE8A8B8);

  // ---------------------------------------------------------
  // Obsidian Surfaces & Dark Glassmorphism Canvas
  // ---------------------------------------------------------
  /// Base Obsidian Canvas (`#09060E`): Deepest dark theater canvas.
  static const Color baseObsidian = Color(0xFF09060E);

  /// Surface Deep (`#120C1F`): Groupings, bottom sheet bases.
  static const Color surfaceDeep = Color(0xFF120C1F);

  /// Glass Surface (`rgba(24, 15, 41, 0.65)`): Floating cards, subtle glass layer.
  static const Color glassSurface = Color(0xA6180F29);

  /// Glass Card / Shelf (`rgba(18, 12, 31, 0.75)`): Tier 1 surface cards.
  static const Color glassSurfaceCard = Color(0xBF120C1F);

  /// Glass Floating Controls (`rgba(24, 15, 41, 0.85)`): Modals, floating player controls.
  static const Color glassSurfaceFloating = Color(0xD9180F29);

  /// Floating Island Dock (`rgba(15, 10, 26, 0.85)`): Bottom navigation bar glass.
  static const Color glassFloatingDock = Color(0xD90F0A1A);

  /// Surface Border (`rgba(242, 184, 198, 0.4)`): Rose rim outline.
  static const Color surfaceBorder = Color(0x66F2B8C6);

  /// Rim Stroke Top (`rgba(242, 184, 198, 0.35)`): Highlighted top border.
  static const Color rimStrokeTop = Color(0x59F2B8C6);

  /// Hairline White (`rgba(255, 255, 255, 0.08)`): Subtle border stroke for Tier 1 cards.
  static const Color hairlineWhite = Color(0x14FFFFFF);

  /// Border Subtle (`rgba(255, 255, 255, 0.15)`): Secondary actions border.
  static const Color borderSubtle = Color(0x26FFFFFF);

  /// Input Background (`rgba(255, 255, 255, 0.06)`): Search bars, input capsules.
  static const Color inputBackground = Color(0x0FFFFFFF);

  /// Score Chip Background (`rgba(243, 201, 105, 0.2)`): Gold rating pill tint.
  static const Color scoreChipBackground = Color(0x33F3C969);

  /// Score Chip Border / Accent (`#F3C969`).
  static const Color scoreChipBorder = Color(0xFFF3C969);

  // ---------------------------------------------------------
  // Typography Colors
  // ---------------------------------------------------------
  /// High-contrast primary text (`#F9FAFB`).
  static const Color textPrimary = Color(0xFFF9FAFB);

  /// Secondary text (`#9CA3AF`).
  static const Color textSecondary = Color(0xFF9CA3AF);

  /// Subtle metadata text (`#6B7280`).
  static const Color textSubtle = Color(0xFF6B7280);

  // ---------------------------------------------------------
  // Material 3 Color Tokens (derived from seed `#491E29`)
  // ---------------------------------------------------------
  static const Color surface = Color(0xFF16121B);
  static const Color surfaceDim = Color(0xFF16121B);
  static const Color surfaceBright = Color(0xFF3C3741);
  static const Color surfaceContainerLowest = Color(0xFF100D15);
  static const Color surfaceContainerLow = Color(0xFF1E1A23);
  static const Color surfaceContainer = Color(0xFF221E27);
  static const Color surfaceContainerHigh = Color(0xFF2D2832);
  static const Color surfaceContainerHighest = Color(0xFF38333D);
  static const Color surfaceVariant = Color(0xFF38333D);

  static const Color onSurface = Color(0xFFE8DFED);
  static const Color onSurfaceVariant = Color(0xFFCBC3D7);
  static const Color inverseSurface = Color(0xFFE8DFED);
  static const Color inverseOnSurface = Color(0xFF332E38);

  static const Color outline = Color(0xFF958EA0);
  static const Color outlineVariant = Color(0xFF494454);
  static const Color surfaceTint = Color(0xFFF2B8C6);

  static const Color primary = Color(0xFFF2B8C6);
  static const Color onPrimary = Color(0xFF491E29);
  static const Color primaryContainer = Color(0xFF6E2F3F);
  static const Color onPrimaryContainer = Color(0xFFFFD9E2);
  static const Color inversePrimary = Color(0xFF491E29);

  static const Color secondary = Color(0xFFE8A8B8);
  static const Color onSecondary = Color(0xFF491E29);
  static const Color secondaryContainer = Color(0xFF5C2736);
  static const Color onSecondaryContainer = Color(0xFFFFD9E2);

  static const Color tertiary = Color(0xFFF3C969);
  static const Color onTertiary = Color(0xFF3D2A00);
  static const Color tertiaryContainer = Color(0xFF5A4210);
  static const Color onTertiaryContainer = Color(0xFFFFE8A8);

  static const Color error = Color(0xFFFFB4AB);
  static const Color onError = Color(0xFF690005);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onErrorContainer = Color(0xFFFFDAD6);

  static const Color primaryFixed = Color(0xFFFFD9E2);
  static const Color primaryFixedDim = Color(0xFFF2B8C6);
  static const Color onPrimaryFixed = Color(0xFF3A0714);
  static const Color onPrimaryFixedVariant = Color(0xFF6E2F3F);

  static const Color secondaryFixed = Color(0xFFFFD9E2);
  static const Color secondaryFixedDim = Color(0xFFE8A8B8);
  static const Color onSecondaryFixed = Color(0xFF3A0714);
  static const Color onSecondaryFixedVariant = Color(0xFF5C2736);

  static const Color tertiaryFixed = Color(0xFFFFE8A8);
  static const Color tertiaryFixedDim = Color(0xFFF3C969);
  static const Color onTertiaryFixed = Color(0xFF2E2000);
  static const Color onTertiaryFixedVariant = Color(0xFF5A4210);

  static const Color background = Color(0xFF16121B);
  static const Color onBackground = Color(0xFFE8DFED);

  /// Material 3 [ColorScheme] tailored for the Rose & Gold dark theme.
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    inversePrimary: inversePrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surface,
    onSurface: onSurface,
    surfaceDim: surfaceDim,
    surfaceBright: surfaceBright,
    surfaceContainerLowest: surfaceContainerLowest,
    surfaceContainerLow: surfaceContainerLow,
    surfaceContainer: surfaceContainer,
    surfaceContainerHigh: surfaceContainerHigh,
    surfaceContainerHighest: surfaceContainerHighest,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    shadow: Colors.black,
    scrim: baseObsidian,
    inverseSurface: inverseSurface,
    onInverseSurface: inverseOnSurface,
    surfaceTint: surfaceTint,
  );
}
