import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'app_typography.dart';

/// Effects, glows, shadows, gradients, and glassmorphism helpers.
abstract final class AppShadows {
  /// Tier 1 & 2 ambient shadow:
  /// `box-shadow: 0 12px 32px -4px rgba(242, 184, 198, 0.4)`
  static const BoxShadow ambientUltraviolet = BoxShadow(
    color: Color(0x66F2B8C6),
    blurRadius: 32,
    offset: Offset(0, 12),
    spreadRadius: -4,
  );

  /// Primary play button glow: `0 6px 20px rgba(242, 184, 198, 0.4)`
  static const BoxShadow playButtonGlow = BoxShadow(
    color: Color(0x66F2B8C6),
    blurRadius: 20,
    offset: Offset(0, 6),
  );

  /// Gold poster glow on tap/focus:
  /// `0 8px 24px -2px rgba(243, 201, 105, 0.3)`
  static const BoxShadow posterEmeraldGlow = BoxShadow(
    color: Color(0x4DF3C969),
    blurRadius: 24,
    offset: Offset(0, 8),
    spreadRadius: -2,
  );

  /// Standard rose poster glow:
  /// `0 8px 24px -2px rgba(242, 184, 198, 0.35)`
  static const BoxShadow posterUltravioletGlow = BoxShadow(
    color: Color(0x59F2B8C6),
    blurRadius: 24,
    offset: Offset(0, 8),
    spreadRadius: -2,
  );
}

/// Gradients from the Obsidian Lumina design system.
abstract final class AppGradients {
  /// Primary Play action gradient: `linear-gradient(135deg, #F2B8C6, #E8A8B8)`
  static const LinearGradient playAction = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.electricUltraviolet, AppColors.brightHeliotrope],
  );

  /// Poster bottom scrim gradient for overlay title readability.
  static const LinearGradient posterBottomScrim = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, AppColors.baseObsidian],
    stops: [0.4, 1.0],
  );

  /// Hero backdrop overlay gradient to smoothly transition into base obsidian.
  static const LinearGradient heroOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Color(0x8009060E), AppColors.baseObsidian],
    stops: [0.2, 0.7, 1.0],
  );

  /// Ambient rose glow aura.
  static const RadialGradient ambientHalo = RadialGradient(
    colors: [Color(0x33F2B8C6), Colors.transparent],
    radius: 0.8,
  );
}

/// Blur definitions for Dark Glassmorphism.
abstract final class AppBlurs {
  /// Tier 1 surface card blur (16px).
  static const double card = 16.0;

  /// Tier 2 floating controls, modals, and dock blur (24px).
  static const double floating = 24.0;

  /// [ImageFilter] for Tier 1 cards.
  static final ImageFilter cardFilter = ImageFilter.blur(
    sigmaX: card,
    sigmaY: card,
  );

  /// [ImageFilter] for Tier 2 floating elements.
  static final ImageFilter floatingFilter = ImageFilter.blur(
    sigmaX: floating,
    sigmaY: floating,
  );
}

/// Glassmorphism box decoration presets.
abstract final class AppGlassDecorations {
  /// Tier 1 Surface Card decoration:
  /// `rgba(18, 12, 31, 0.75)` with hairline outer stroke.
  static BoxDecoration tier1Card({BorderRadius? borderRadius}) => BoxDecoration(
    color: AppColors.glassSurfaceCard,
    borderRadius: borderRadius ?? AppBorderRadius.lg,
    border: Border.all(color: AppColors.hairlineWhite, width: 1.0),
    boxShadow: const [AppShadows.ambientUltraviolet],
  );

  /// Tier 2 Floating Player / Modal decoration with a violet top rim stroke.
  static BoxDecoration tier2Floating({BorderRadius? borderRadius}) =>
      BoxDecoration(
        color: AppColors.glassSurfaceFloating,
        borderRadius: borderRadius ?? AppBorderRadius.xl,
        border: Border(
          top: const BorderSide(color: AppColors.rimStrokeTop, width: 1.5),
          left: const BorderSide(color: AppColors.surfaceBorder),
          right: const BorderSide(color: AppColors.surfaceBorder),
          bottom: const BorderSide(color: AppColors.surfaceBorder),
        ),
        boxShadow: const [AppShadows.ambientUltraviolet],
      );

  /// Floating Island Bottom Dock decoration.
  static BoxDecoration get floatingDock => BoxDecoration(
    color: AppColors.glassFloatingDock,
    borderRadius: AppBorderRadius.full,
    border: Border.all(color: AppColors.surfaceBorder, width: 1.0),
    boxShadow: const [AppShadows.ambientUltraviolet],
  );

  /// Score Chip decoration with deep emerald tint and neon emerald border.
  static BoxDecoration get scoreChip => BoxDecoration(
    color: AppColors.scoreChipBackground,
    borderRadius: AppBorderRadius.full,
    border: Border.all(color: AppColors.scoreChipBorder, width: 1.0),
  );

  /// Codec / Quality flag micro pill decoration (4K, IMAX, Dolby).
  static BoxDecoration get qualityFlag => BoxDecoration(
    color: AppColors.surfaceContainerLowest,
    borderRadius: AppBorderRadius.full,
    border: Border.all(color: AppColors.hairlineWhite, width: 1.0),
  );

  /// Translucent obsidian capsule used by search bars and input surfaces.
  static BoxDecoration get searchCapsule => BoxDecoration(
    color: AppColors.inputBackground,
    borderRadius: AppBorderRadius.full,
    border: Border.all(color: AppColors.hairlineWhite, width: 1.0),
  );
}

/// Theme extension for the Obsidian Lumina cinematic design system.
///
/// Allows widgets to access cinema-grade tokens directly via
/// `Theme.of(context).extension<ObsidianLuminaThemeExtension>()`
/// or the convenient extension `context.lumina`.
@immutable
class ObsidianLuminaThemeExtension
    extends ThemeExtension<ObsidianLuminaThemeExtension> {
  const ObsidianLuminaThemeExtension({
    required this.electricUltraviolet,
    required this.vividEmeraldLime,
    required this.brightHeliotrope,
    required this.baseObsidian,
    required this.surfaceDeep,
    required this.glassSurface,
    required this.glassSurfaceCard,
    required this.glassSurfaceFloating,
    required this.glassFloatingDock,
    required this.surfaceBorder,
    required this.rimStrokeTop,
    required this.hairlineWhite,
    required this.borderSubtle,
    required this.inputBackground,
    required this.scoreChipBackground,
    required this.scoreChipBorder,
    required this.textPrimary,
    required this.textSecondary,
    required this.textSubtle,
    required this.playActionGradient,
    required this.posterBottomScrimGradient,
    required this.heroOverlayGradient,
    required this.ambientHaloGradient,
    required this.ambientShadow,
    required this.playButtonGlow,
    required this.posterEmeraldGlow,
    required this.posterUltravioletGlow,
    required this.cardBlur,
    required this.floatingBlur,
    required this.badgeScoreStyle,
    required this.qualityFlagStyle,
    required this.headlineXlMobile,
    required this.headlineLgMobile,
  });

  final Color electricUltraviolet;
  final Color vividEmeraldLime;
  final Color brightHeliotrope;
  final Color baseObsidian;
  final Color surfaceDeep;
  final Color glassSurface;
  final Color glassSurfaceCard;
  final Color glassSurfaceFloating;
  final Color glassFloatingDock;
  final Color surfaceBorder;
  final Color rimStrokeTop;
  final Color hairlineWhite;
  final Color borderSubtle;
  final Color inputBackground;
  final Color scoreChipBackground;
  final Color scoreChipBorder;
  final Color textPrimary;
  final Color textSecondary;
  final Color textSubtle;

  final LinearGradient playActionGradient;
  final LinearGradient posterBottomScrimGradient;
  final LinearGradient heroOverlayGradient;
  final RadialGradient ambientHaloGradient;

  final BoxShadow ambientShadow;
  final BoxShadow playButtonGlow;
  final BoxShadow posterEmeraldGlow;
  final BoxShadow posterUltravioletGlow;

  final double cardBlur;
  final double floatingBlur;

  final TextStyle badgeScoreStyle;
  final TextStyle qualityFlagStyle;
  final TextStyle headlineXlMobile;
  final TextStyle headlineLgMobile;

  /// Default Obsidian Lumina configuration.
  static final ObsidianLuminaThemeExtension defaultInstance =
      ObsidianLuminaThemeExtension(
        electricUltraviolet: AppColors.electricUltraviolet,
        vividEmeraldLime: AppColors.vividEmeraldLime,
        brightHeliotrope: AppColors.brightHeliotrope,
        baseObsidian: AppColors.baseObsidian,
        surfaceDeep: AppColors.surfaceDeep,
        glassSurface: AppColors.glassSurface,
        glassSurfaceCard: AppColors.glassSurfaceCard,
        glassSurfaceFloating: AppColors.glassSurfaceFloating,
        glassFloatingDock: AppColors.glassFloatingDock,
        surfaceBorder: AppColors.surfaceBorder,
        rimStrokeTop: AppColors.rimStrokeTop,
        hairlineWhite: AppColors.hairlineWhite,
        borderSubtle: AppColors.borderSubtle,
        inputBackground: AppColors.inputBackground,
        scoreChipBackground: AppColors.scoreChipBackground,
        scoreChipBorder: AppColors.scoreChipBorder,
        textPrimary: AppColors.textPrimary,
        textSecondary: AppColors.textSecondary,
        textSubtle: AppColors.textSubtle,
        playActionGradient: AppGradients.playAction,
        posterBottomScrimGradient: AppGradients.posterBottomScrim,
        heroOverlayGradient: AppGradients.heroOverlay,
        ambientHaloGradient: AppGradients.ambientHalo,
        ambientShadow: AppShadows.ambientUltraviolet,
        playButtonGlow: AppShadows.playButtonGlow,
        posterEmeraldGlow: AppShadows.posterEmeraldGlow,
        posterUltravioletGlow: AppShadows.posterUltravioletGlow,
        cardBlur: AppBlurs.card,
        floatingBlur: AppBlurs.floating,
        badgeScoreStyle: AppTypography.badgeScore,
        qualityFlagStyle: AppTypography.qualityFlag,
        headlineXlMobile: AppTypography.headlineXlMobile,
        headlineLgMobile: AppTypography.headlineLgMobile,
      );

  @override
  ObsidianLuminaThemeExtension copyWith({
    Color? electricUltraviolet,
    Color? vividEmeraldLime,
    Color? brightHeliotrope,
    Color? baseObsidian,
    Color? surfaceDeep,
    Color? glassSurface,
    Color? glassSurfaceCard,
    Color? glassSurfaceFloating,
    Color? glassFloatingDock,
    Color? surfaceBorder,
    Color? rimStrokeTop,
    Color? hairlineWhite,
    Color? borderSubtle,
    Color? inputBackground,
    Color? scoreChipBackground,
    Color? scoreChipBorder,
    Color? textPrimary,
    Color? textSecondary,
    Color? textSubtle,
    LinearGradient? playActionGradient,
    LinearGradient? posterBottomScrimGradient,
    LinearGradient? heroOverlayGradient,
    RadialGradient? ambientHaloGradient,
    BoxShadow? ambientShadow,
    BoxShadow? playButtonGlow,
    BoxShadow? posterEmeraldGlow,
    BoxShadow? posterUltravioletGlow,
    double? cardBlur,
    double? floatingBlur,
    TextStyle? badgeScoreStyle,
    TextStyle? qualityFlagStyle,
    TextStyle? headlineXlMobile,
    TextStyle? headlineLgMobile,
  }) {
    return ObsidianLuminaThemeExtension(
      electricUltraviolet: electricUltraviolet ?? this.electricUltraviolet,
      vividEmeraldLime: vividEmeraldLime ?? this.vividEmeraldLime,
      brightHeliotrope: brightHeliotrope ?? this.brightHeliotrope,
      baseObsidian: baseObsidian ?? this.baseObsidian,
      surfaceDeep: surfaceDeep ?? this.surfaceDeep,
      glassSurface: glassSurface ?? this.glassSurface,
      glassSurfaceCard: glassSurfaceCard ?? this.glassSurfaceCard,
      glassSurfaceFloating: glassSurfaceFloating ?? this.glassSurfaceFloating,
      glassFloatingDock: glassFloatingDock ?? this.glassFloatingDock,
      surfaceBorder: surfaceBorder ?? this.surfaceBorder,
      rimStrokeTop: rimStrokeTop ?? this.rimStrokeTop,
      hairlineWhite: hairlineWhite ?? this.hairlineWhite,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      inputBackground: inputBackground ?? this.inputBackground,
      scoreChipBackground: scoreChipBackground ?? this.scoreChipBackground,
      scoreChipBorder: scoreChipBorder ?? this.scoreChipBorder,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textSubtle: textSubtle ?? this.textSubtle,
      playActionGradient: playActionGradient ?? this.playActionGradient,
      posterBottomScrimGradient:
          posterBottomScrimGradient ?? this.posterBottomScrimGradient,
      heroOverlayGradient: heroOverlayGradient ?? this.heroOverlayGradient,
      ambientHaloGradient: ambientHaloGradient ?? this.ambientHaloGradient,
      ambientShadow: ambientShadow ?? this.ambientShadow,
      playButtonGlow: playButtonGlow ?? this.playButtonGlow,
      posterEmeraldGlow: posterEmeraldGlow ?? this.posterEmeraldGlow,
      posterUltravioletGlow:
          posterUltravioletGlow ?? this.posterUltravioletGlow,
      cardBlur: cardBlur ?? this.cardBlur,
      floatingBlur: floatingBlur ?? this.floatingBlur,
      badgeScoreStyle: badgeScoreStyle ?? this.badgeScoreStyle,
      qualityFlagStyle: qualityFlagStyle ?? this.qualityFlagStyle,
      headlineXlMobile: headlineXlMobile ?? this.headlineXlMobile,
      headlineLgMobile: headlineLgMobile ?? this.headlineLgMobile,
    );
  }

  @override
  ObsidianLuminaThemeExtension lerp(
    covariant ThemeExtension<ObsidianLuminaThemeExtension>? other,
    double t,
  ) {
    if (other is! ObsidianLuminaThemeExtension) {
      return this;
    }

    return ObsidianLuminaThemeExtension(
      electricUltraviolet: Color.lerp(
        electricUltraviolet,
        other.electricUltraviolet,
        t,
      )!,
      vividEmeraldLime: Color.lerp(
        vividEmeraldLime,
        other.vividEmeraldLime,
        t,
      )!,
      brightHeliotrope: Color.lerp(
        brightHeliotrope,
        other.brightHeliotrope,
        t,
      )!,
      baseObsidian: Color.lerp(baseObsidian, other.baseObsidian, t)!,
      surfaceDeep: Color.lerp(surfaceDeep, other.surfaceDeep, t)!,
      glassSurface: Color.lerp(glassSurface, other.glassSurface, t)!,
      glassSurfaceCard: Color.lerp(
        glassSurfaceCard,
        other.glassSurfaceCard,
        t,
      )!,
      glassSurfaceFloating: Color.lerp(
        glassSurfaceFloating,
        other.glassSurfaceFloating,
        t,
      )!,
      glassFloatingDock: Color.lerp(
        glassFloatingDock,
        other.glassFloatingDock,
        t,
      )!,
      surfaceBorder: Color.lerp(surfaceBorder, other.surfaceBorder, t)!,
      rimStrokeTop: Color.lerp(rimStrokeTop, other.rimStrokeTop, t)!,
      hairlineWhite: Color.lerp(hairlineWhite, other.hairlineWhite, t)!,
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t)!,
      inputBackground: Color.lerp(inputBackground, other.inputBackground, t)!,
      scoreChipBackground: Color.lerp(
        scoreChipBackground,
        other.scoreChipBackground,
        t,
      )!,
      scoreChipBorder: Color.lerp(scoreChipBorder, other.scoreChipBorder, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textSubtle: Color.lerp(textSubtle, other.textSubtle, t)!,
      playActionGradient: LinearGradient.lerp(
        playActionGradient,
        other.playActionGradient,
        t,
      )!,
      posterBottomScrimGradient: LinearGradient.lerp(
        posterBottomScrimGradient,
        other.posterBottomScrimGradient,
        t,
      )!,
      heroOverlayGradient: LinearGradient.lerp(
        heroOverlayGradient,
        other.heroOverlayGradient,
        t,
      )!,
      ambientHaloGradient: RadialGradient.lerp(
        ambientHaloGradient,
        other.ambientHaloGradient,
        t,
      )!,
      ambientShadow: BoxShadow.lerp(ambientShadow, other.ambientShadow, t)!,
      playButtonGlow: BoxShadow.lerp(playButtonGlow, other.playButtonGlow, t)!,
      posterEmeraldGlow: BoxShadow.lerp(
        posterEmeraldGlow,
        other.posterEmeraldGlow,
        t,
      )!,
      posterUltravioletGlow: BoxShadow.lerp(
        posterUltravioletGlow,
        other.posterUltravioletGlow,
        t,
      )!,
      cardBlur: lerpDouble(cardBlur, other.cardBlur, t)!,
      floatingBlur: lerpDouble(floatingBlur, other.floatingBlur, t)!,
      badgeScoreStyle: TextStyle.lerp(
        badgeScoreStyle,
        other.badgeScoreStyle,
        t,
      )!,
      qualityFlagStyle: TextStyle.lerp(
        qualityFlagStyle,
        other.qualityFlagStyle,
        t,
      )!,
      headlineXlMobile: TextStyle.lerp(
        headlineXlMobile,
        other.headlineXlMobile,
        t,
      )!,
      headlineLgMobile: TextStyle.lerp(
        headlineLgMobile,
        other.headlineLgMobile,
        t,
      )!,
    );
  }
}

/// Extension methods on [BuildContext] for ergonomic access to the
/// Obsidian Lumina design system.
extension ThemeContextExtensions on BuildContext {
  /// Current [ThemeData].
  ThemeData get theme => Theme.of(this);

  /// Current [ColorScheme].
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Current [TextTheme].
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Obsidian Lumina cinema tokens extension.
  ObsidianLuminaThemeExtension get lumina =>
      Theme.of(this).extension<ObsidianLuminaThemeExtension>() ??
      ObsidianLuminaThemeExtension.defaultInstance;

  /// True if current theme brightness is dark.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Screen size shortcuts.
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  /// Responsive breakpoint: tablet or wider (>= 640px per DESIGN.md).
  bool get isTablet => screenWidth >= 640;

  /// Mobile-first breakpoint complement.
  bool get isMobile => !isTablet;
}
