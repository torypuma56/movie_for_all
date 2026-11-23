import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_theme_extension.dart';
import 'app_typography.dart';

export 'app_colors.dart';
export 'app_radius.dart';
export 'app_spacing.dart';
export 'app_theme_extension.dart';
export 'app_typography.dart';

/// Obsidian Lumina Theme Manager for Movie 4 All.
///
/// Designed in accordance with `.agents/skills/design/DESIGN.md`:
/// - Theater-grade dark glassmorphism
/// - Deep obsidian canvas (`#09060E`)
/// - Rose (`#F2B8C6`) & Warm Gold (`#F3C969`) accents derived from `#491E29`
/// - Plus Jakarta Sans geometric typography
abstract final class AppTheme {
  /// Dark Theme instance powering the entire cinema experience.
  static ThemeData get darkTheme {
    final scheme = AppColors.colorScheme;
    final textTheme = AppTypography.textTheme;
    final lumina = ObsidianLuminaThemeExtension.defaultInstance;

    final borderRadius = AppBorderRadius.full;
    final dialogRadius = AppBorderRadius.xl;
    final cardRadius = AppBorderRadius.lg;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.baseObsidian,
      canvasColor: AppColors.baseObsidian,
      cardColor: AppColors.surfaceContainerLow,
      dividerColor: AppColors.hairlineWhite,
      disabledColor: AppColors.textSubtle.withValues(alpha: 0.38),
      hintColor: AppColors.textSubtle,
      focusColor: AppColors.electricUltraviolet.withValues(alpha: 0.16),
      hoverColor: Colors.white.withValues(alpha: 0.04),
      highlightColor: AppColors.electricUltraviolet.withValues(alpha: 0.10),
      splashColor: AppColors.electricUltraviolet.withValues(alpha: 0.14),
      splashFactory: InkRipple.splashFactory,
      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 24),
      primaryIconTheme: const IconThemeData(
        color: AppColors.onPrimary,
        size: 24,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.electricUltraviolet,
        selectionColor: AppColors.electricUltraviolet.withValues(alpha: 0.32),
        selectionHandleColor: AppColors.electricUltraviolet,
      ),

      // --- App Bar ---
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleSpacing: AppSpacing.margin,
        titleTextStyle: AppTypography.titleLg,
        toolbarTextStyle: AppTypography.titleMd,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        actionsIconTheme: const IconThemeData(color: AppColors.textPrimary),
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: AppColors.baseObsidian,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),

      // --- Cards & Sheets ---
      cardTheme: CardThemeData(
        color: AppColors.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: cardRadius,
          side: const BorderSide(color: AppColors.hairlineWhite, width: 1.0),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surfaceDeep,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        barrierColor: Colors.black.withValues(alpha: 0.70),
        elevation: 0,
        alignment: Alignment.center,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        clipBehavior: Clip.antiAlias,
        constraints: const BoxConstraints(maxWidth: 420),
        shape: RoundedRectangleBorder(
          borderRadius: dialogRadius,
          side: const BorderSide(color: AppColors.surfaceBorder, width: 1.0),
        ),
        titleTextStyle: AppTypography.titleLg,
        contentTextStyle: AppTypography.bodyMd,
        actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.surfaceDeep,
        modalBackgroundColor: AppColors.surfaceDeep,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        modalElevation: 0,
        showDragHandle: true,
        dragHandleColor: AppColors.textSubtle,
        dragHandleSize: const Size(40, 4),
        clipBehavior: Clip.antiAlias,
        modalBarrierColor: Colors.black.withValues(alpha: 0.70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.xl),
          ),
          side: const BorderSide(color: AppColors.surfaceBorder, width: 1.0),
        ),
      ),

      // --- Primary & Brand Actions ---
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.electricUltraviolet,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.surfaceContainerHigh,
          disabledForegroundColor: AppColors.textSubtle,
          elevation: 0,
          shadowColor: Colors.transparent,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: const StadiumBorder(),
          textStyle: AppTypography.labelMd.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.electricUltraviolet,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.surfaceContainerHigh,
          disabledForegroundColor: AppColors.textSubtle,
          elevation: 0,
          shadowColor: Colors.transparent,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: const StadiumBorder(),
          textStyle: AppTypography.labelMd.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.hairlineWhite,
          foregroundColor: AppColors.textPrimary,
          disabledForegroundColor: AppColors.textSubtle,
          elevation: 0,
          minimumSize: const Size(0, 44),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          side: const BorderSide(color: AppColors.borderSubtle, width: 1.0),
          shape: const StadiumBorder(),
          textStyle: AppTypography.labelMd.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.electricUltraviolet,
          disabledForegroundColor: AppColors.textSubtle,
          minimumSize: const Size(0, 40),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: const StadiumBorder(),
          textStyle: AppTypography.labelMd,
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          disabledForegroundColor: AppColors.textSubtle,
          overlayColor: AppColors.electricUltraviolet.withValues(alpha: 0.12),
          minimumSize: const Size(40, 40),
          padding: const EdgeInsets.all(10),
          iconSize: 22,
          shape: const CircleBorder(),
        ),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.electricUltraviolet,
        foregroundColor: Colors.white,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: CircleBorder(),
        sizeConstraints: BoxConstraints.tightFor(width: 56, height: 56),
      ),

      // --- Inputs & Search ---
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputBackground,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        hintStyle: AppTypography.bodyMd.copyWith(color: AppColors.textSubtle),
        labelStyle: AppTypography.bodyMd.copyWith(
          color: AppColors.textSecondary,
        ),
        floatingLabelStyle: AppTypography.bodySm.copyWith(
          color: AppColors.electricUltraviolet,
          fontWeight: FontWeight.w600,
        ),
        helperStyle: AppTypography.bodySm,
        errorStyle: AppTypography.bodySm.copyWith(color: scheme.error),
        counterStyle: AppTypography.bodySm,
        prefixIconColor: AppColors.textSecondary,
        suffixIconColor: AppColors.textSecondary,
        iconColor: AppColors.textSecondary,
        errorMaxLines: 2,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            color: AppColors.hairlineWhite,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            color: AppColors.electricUltraviolet,
            width: 1.2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: scheme.error, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: scheme.error, width: 1.5),
        ),
      ),

      searchBarTheme: SearchBarThemeData(
        elevation: const WidgetStatePropertyAll<double?>(0),
        backgroundColor: const WidgetStatePropertyAll<Color?>(
          AppColors.inputBackground,
        ),
        shadowColor: const WidgetStatePropertyAll<Color?>(Colors.transparent),
        surfaceTintColor: const WidgetStatePropertyAll<Color?>(
          Colors.transparent,
        ),
        overlayColor: WidgetStatePropertyAll<Color?>(
          AppColors.electricUltraviolet.withValues(alpha: 0.08),
        ),
        side: const WidgetStatePropertyAll<BorderSide?>(BorderSide.none),
        shape: const WidgetStatePropertyAll<OutlinedBorder?>(StadiumBorder()),
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry?>(
          EdgeInsets.symmetric(horizontal: 16),
        ),
        textStyle: WidgetStatePropertyAll<TextStyle?>(
          AppTypography.bodyMd.copyWith(color: AppColors.textPrimary),
        ),
        hintStyle: WidgetStatePropertyAll<TextStyle?>(
          AppTypography.bodyMd.copyWith(color: AppColors.textSubtle),
        ),
        constraints: const BoxConstraints(minHeight: 52),
      ),

      // --- Selection Controls ---
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceContainerLow,
        disabledColor: AppColors.surfaceContainer,
        selectedColor: AppColors.electricUltraviolet.withValues(alpha: 0.18),
        secondarySelectedColor: AppColors.vividEmeraldLime.withValues(
          alpha: 0.18,
        ),
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        selectedShadowColor: Colors.transparent,
        showCheckmark: false,
        checkmarkColor: Colors.white,
        labelStyle: AppTypography.labelSm.copyWith(
          color: AppColors.textPrimary,
        ),
        secondaryLabelStyle: AppTypography.labelSm.copyWith(
          color: AppColors.textSecondary,
        ),
        side: const BorderSide(color: AppColors.hairlineWhite, width: 1.0),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        labelPadding: const EdgeInsets.symmetric(horizontal: 2),
        brightness: Brightness.dark,
        elevation: 0,
        pressElevation: 0,
      ),

      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.rawSm),
        ),
        side: const BorderSide(color: AppColors.outline, width: 1.5),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.electricUltraviolet;
          }
          return Colors.transparent;
        }),
        checkColor: const WidgetStatePropertyAll<Color?>(Colors.white),
        overlayColor: WidgetStatePropertyAll<Color?>(
          AppColors.electricUltraviolet.withValues(alpha: 0.12),
        ),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return AppColors.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.electricUltraviolet;
          }
          return AppColors.surfaceContainerHighest;
        }),
        trackOutlineColor: const WidgetStatePropertyAll<Color?>(
          AppColors.hairlineWhite,
        ),
        overlayColor: WidgetStatePropertyAll<Color?>(
          AppColors.electricUltraviolet.withValues(alpha: 0.12),
        ),
      ),

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.electricUltraviolet;
          }
          return AppColors.outline;
        }),
        overlayColor: WidgetStatePropertyAll<Color?>(
          AppColors.electricUltraviolet.withValues(alpha: 0.12),
        ),
      ),

      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.electricUltraviolet.withValues(alpha: 0.18);
            }
            return Colors.transparent;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.textPrimary;
            }
            return AppColors.textSecondary;
          }),
          overlayColor: WidgetStatePropertyAll<Color?>(
            AppColors.electricUltraviolet.withValues(alpha: 0.12),
          ),
          side: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return BorderSide(
                color: AppColors.electricUltraviolet.withValues(alpha: 0.55),
                width: 1.0,
              );
            }
            return const BorderSide(color: AppColors.hairlineWhite, width: 1.0);
          }),
          shape: const WidgetStatePropertyAll<OutlinedBorder?>(StadiumBorder()),
          textStyle: WidgetStatePropertyAll<TextStyle?>(
            AppTypography.labelMd.copyWith(fontWeight: FontWeight.w700),
          ),
          padding: const WidgetStatePropertyAll<EdgeInsetsGeometry?>(
            EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          ),
          minimumSize: const WidgetStatePropertyAll<Size?>(Size(0, 42)),
          tapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),

      sliderTheme: SliderThemeData(
        trackHeight: 4,
        activeTrackColor: AppColors.electricUltraviolet,
        inactiveTrackColor: AppColors.surfaceContainerHighest,
        secondaryActiveTrackColor: AppColors.vividEmeraldLime,
        thumbColor: Colors.white,
        overlayColor: AppColors.electricUltraviolet.withValues(alpha: 0.12),
        valueIndicatorColor: AppColors.electricUltraviolet,
        valueIndicatorTextStyle: AppTypography.labelSm.copyWith(
          color: Colors.white,
        ),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
        trackGap: 4,
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.electricUltraviolet,
        linearTrackColor: AppColors.surfaceContainerHighest,
        linearMinHeight: 3,
        circularTrackColor: AppColors.surfaceContainerHighest,
        refreshBackgroundColor: AppColors.surfaceDeep,
        borderRadius: borderRadius,
        stopIndicatorColor: AppColors.textSubtle,
        strokeWidth: 3,
      ),

      // --- Navigation & Floating Dock ---
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.glassFloatingDock,
        selectedItemColor: AppColors.electricUltraviolet,
        unselectedItemColor: AppColors.textSubtle,
        selectedLabelStyle: AppTypography.labelSm.copyWith(
          color: AppColors.electricUltraviolet,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: AppTypography.labelSm.copyWith(
          color: AppColors.textSubtle,
        ),
        selectedIconTheme: const IconThemeData(
          color: AppColors.electricUltraviolet,
          size: 22,
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColors.textSubtle,
          size: 22,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),

      navigationBarTheme: NavigationBarThemeData(
        height: 72,
        backgroundColor: AppColors.glassFloatingDock,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        indicatorColor: AppColors.electricUltraviolet.withValues(alpha: 0.22),
        indicatorShape: const StadiumBorder(),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTypography.labelSm.copyWith(
              color: AppColors.electricUltraviolet,
              fontWeight: FontWeight.w700,
            );
          }
          return AppTypography.labelSm.copyWith(color: AppColors.textSubtle);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.electricUltraviolet);
          }
          return const IconThemeData(color: AppColors.textSubtle);
        }),
        overlayColor: WidgetStatePropertyAll<Color?>(
          AppColors.electricUltraviolet.withValues(alpha: 0.08),
        ),
      ),

      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        useIndicator: true,
        indicatorColor: AppColors.electricUltraviolet.withValues(alpha: 0.22),
        indicatorShape: const StadiumBorder(),
        selectedIconTheme: const IconThemeData(
          color: AppColors.electricUltraviolet,
          size: 24,
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColors.textSubtle,
          size: 24,
        ),
        selectedLabelTextStyle: AppTypography.labelSm.copyWith(
          color: AppColors.electricUltraviolet,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelTextStyle: AppTypography.labelSm.copyWith(
          color: AppColors.textSubtle,
        ),
        labelType: NavigationRailLabelType.all,
      ),

      bottomAppBarTheme: BottomAppBarThemeData(
        color: AppColors.glassFloatingDock,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),

      drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.surfaceDeep,
        scrimColor: Colors.black.withValues(alpha: 0.65),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        width: 320,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(AppRadius.xl),
          ),
          side: const BorderSide(color: AppColors.surfaceBorder, width: 1.0),
        ),
      ),

      tabBarTheme: TabBarThemeData(
        indicatorColor: AppColors.electricUltraviolet,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: AppColors.hairlineWhite,
        dividerHeight: 1,
        labelColor: AppColors.textPrimary,
        unselectedLabelColor: AppColors.textSubtle,
        labelStyle: AppTypography.labelMd.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: AppTypography.labelMd.copyWith(
          color: AppColors.textSubtle,
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 16),
        splashBorderRadius: borderRadius,
        overlayColor: WidgetStatePropertyAll<Color?>(
          AppColors.electricUltraviolet.withValues(alpha: 0.08),
        ),
      ),

      // --- Lists, Menus & Feedback ---
      listTileTheme: ListTileThemeData(
        tileColor: Colors.transparent,
        selectedTileColor: AppColors.electricUltraviolet.withValues(
          alpha: 0.12,
        ),
        iconColor: AppColors.textSecondary,
        textColor: AppColors.textPrimary,
        selectedColor: AppColors.electricUltraviolet,
        titleTextStyle: AppTypography.titleMd,
        subtitleTextStyle: AppTypography.bodySm,
        leadingAndTrailingTextStyle: AppTypography.labelSm,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        horizontalTitleGap: 12,
        minLeadingWidth: 24,
        minVerticalPadding: 8,
        shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.md),
        visualDensity: VisualDensity.standard,
        enableFeedback: true,
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black.withValues(alpha: 0.45),
        elevation: 12,
        menuPadding: const EdgeInsets.symmetric(vertical: 8),
        iconColor: AppColors.textSecondary,
        iconSize: 20,
        textStyle: AppTypography.bodyMd.copyWith(color: AppColors.textPrimary),
        labelTextStyle: WidgetStatePropertyAll<TextStyle?>(
          AppTypography.labelMd,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.md,
          side: const BorderSide(color: AppColors.surfaceBorder, width: 1.0),
        ),
      ),

      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHigh,
          borderRadius: AppBorderRadius.sm,
          border: Border.all(color: AppColors.hairlineWhite, width: 1.0),
          boxShadow: const [AppShadows.ambientUltraviolet],
        ),
        textStyle: AppTypography.bodySm.copyWith(color: AppColors.textPrimary),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.all(8),
        constraints: const BoxConstraints(minHeight: 32, maxWidth: 280),
        preferBelow: true,
        waitDuration: const Duration(milliseconds: 400),
        showDuration: const Duration(seconds: 3),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceContainerHigh,
        actionTextColor: AppColors.electricUltraviolet,
        disabledActionTextColor: AppColors.textSubtle,
        contentTextStyle: AppTypography.bodyMd.copyWith(
          color: AppColors.textPrimary,
        ),
        elevation: 0,
        insetPadding: const EdgeInsets.all(16),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: AppColors.textSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.md,
          side: const BorderSide(color: AppColors.surfaceBorder, width: 1.0),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.hairlineWhite,
        thickness: 1.0,
        space: 1.0,
      ),

      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll<Color?>(
          AppColors.outline.withValues(alpha: 0.65),
        ),
        trackColor: const WidgetStatePropertyAll<Color?>(Colors.transparent),
        trackBorderColor: const WidgetStatePropertyAll<Color?>(
          Colors.transparent,
        ),
        radius: const Radius.circular(AppRadius.rawFull),
        thickness: const WidgetStatePropertyAll<double?>(4),
        crossAxisMargin: 2,
        mainAxisMargin: 4,
        minThumbLength: 40,
        interactive: true,
      ),

      // --- Custom Obsidian Lumina Tokens ---
      extensions: <ThemeExtension<dynamic>>[lumina],
    );
  }
}
