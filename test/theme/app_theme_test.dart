import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';
import 'package:sizer/sizer.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('AppTheme Tests', () {
    testWidgets('Dark theme initializes with correct Obsidian Lumina tokens', (
      tester,
    ) async {
      late ThemeData theme;

      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, screenType) {
            theme = AppTheme.darkTheme;
            return MaterialApp(theme: theme, home: const SizedBox());
          },
        ),
      );

      expect(theme.brightness, Brightness.dark);
      expect(theme.scaffoldBackgroundColor, AppColors.baseObsidian);
      expect(theme.colorScheme.primary, AppColors.primary);
      expect(theme.colorScheme.surface, AppColors.surface);
      expect(theme.colorScheme.error, AppColors.error);
      expect(AppColors.primary, const Color(0xFFF2B8C6));
      expect(AppColors.onPrimary, const Color(0xFF491E29));
      expect(AppColors.vividEmeraldLime, const Color(0xFFF3C969));
      expect(AppColors.brightHeliotrope, const Color(0xFFE8A8B8));
      expect(AppColors.baseObsidian, const Color(0xFF09060E));
      expect(
        theme.textTheme.bodyMedium?.fontFamily,
        startsWith('PlusJakartaSans'),
      );

      // Verify Obsidian Lumina ThemeExtension is present
      final lumina = theme.extension<ObsidianLuminaThemeExtension>();
      expect(lumina, isNotNull);
      expect(lumina!.electricUltraviolet, AppColors.electricUltraviolet);
      expect(lumina.vividEmeraldLime, AppColors.vividEmeraldLime);
      expect(lumina.brightHeliotrope, AppColors.brightHeliotrope);
      expect(lumina.baseObsidian, AppColors.baseObsidian);
      expect(lumina.textPrimary, AppColors.textPrimary);
      expect(lumina.cardBlur, AppBlurs.card);
      expect(lumina.playActionGradient, AppGradients.playAction);
      expect(lumina.heroOverlayGradient, AppGradients.heroOverlay);
    });

    testWidgets('Component themes follow Obsidian Lumina specifications', (
      tester,
    ) async {
      late ThemeData theme;

      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, screenType) {
            theme = AppTheme.darkTheme;
            return MaterialApp(theme: theme, home: const SizedBox());
          },
        ),
      );

      expect(theme.tabBarTheme.indicatorColor, AppColors.electricUltraviolet);
      expect(theme.bottomAppBarTheme.color, AppColors.glassFloatingDock);
      expect(
        theme.chipTheme.selectedColor,
        AppColors.electricUltraviolet.withValues(alpha: 0.18),
      );
      expect(
        theme.checkboxTheme.fillColor?.resolve({WidgetState.selected}),
        AppColors.electricUltraviolet,
      );
      expect(
        theme.switchTheme.trackColor?.resolve({WidgetState.selected}),
        AppColors.electricUltraviolet,
      );
      expect(theme.segmentedButtonTheme.style, isNotNull);
      expect(theme.searchBarTheme.constraints?.minHeight, 52);
      expect(theme.inputDecorationTheme.fillColor, AppColors.inputBackground);
      expect(
        theme.floatingActionButtonTheme.backgroundColor,
        AppColors.electricUltraviolet,
      );
    });

    testWidgets('Glass decorations use the Obsidian Lumina tokens', (
      tester,
    ) async {
      late BoxDecoration floatingDock;

      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, screenType) {
            floatingDock = AppGlassDecorations.floatingDock;
            return const MaterialApp(home: SizedBox());
          },
        ),
      );

      expect(floatingDock.color, AppColors.glassFloatingDock);
      expect(floatingDock.borderRadius, AppBorderRadius.full);
      expect(
        (floatingDock.boxShadow?.first as BoxShadow).color,
        AppShadows.ambientUltraviolet.color,
      );
      expect(
        AppGlassDecorations.scoreChip.color,
        AppColors.scoreChipBackground,
      );
    });

    test('Spacing and raw radius tokens adhere to specifications', () {
      expect(AppSpacing.spaceXs, 4.0);
      expect(AppSpacing.spaceSm, 8.0);
      expect(AppSpacing.spaceMd, 16.0);
      expect(AppSpacing.spaceLg, 24.0);
      expect(AppSpacing.spaceXl, 32.0);
      expect(AppSpacing.gutter, 16.0);
      expect(AppSpacing.margin, 20.0);

      expect(AppRadius.rawSm, 4.0);
      expect(AppRadius.rawDefault, 8.0);
      expect(AppRadius.rawMd, 12.0);
      expect(AppRadius.rawLg, 16.0);
      expect(AppRadius.rawXl, 24.0);
      expect(AppRadius.full, 9999.0);
    });

    testWidgets('Responsive radii resolve after Sizer initialization', (
      tester,
    ) async {
      late double sm;
      late double lg;

      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, screenType) {
            sm = AppRadius.sm;
            lg = AppRadius.lg;
            return const MaterialApp(home: SizedBox());
          },
        ),
      );

      expect(sm, greaterThan(0));
      expect(lg, greaterThan(sm));
    });

    testWidgets('Theme Context Extensions work properly in widget tree', (
      tester,
    ) async {
      late BuildContext capturedContext;

      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, screenType) {
            return MaterialApp(
              theme: AppTheme.darkTheme,
              home: Builder(
                builder: (context) {
                  capturedContext = context;
                  return const SizedBox();
                },
              ),
            );
          },
        ),
      );

      expect(capturedContext.isDarkMode, isTrue);
      expect(
        capturedContext.lumina.electricUltraviolet,
        AppColors.electricUltraviolet,
      );
      expect(capturedContext.colorScheme.primary, AppColors.primary);
    });
  });
}
