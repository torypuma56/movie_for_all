import 'package:flutter/material.dart';

/// Spacing and Layout values from the Obsidian Lumina design system.
abstract final class AppSpacing {
  /// 4.0 px (0.25rem) - Micro padding, poster internal padding.
  static const double spaceXs = 4.0;

  /// 8.0 px (0.5rem) - Title-to-rail distance, badge padding, compact gaps.
  static const double spaceSm = 8.0;

  /// 16.0 px (1.0rem) - Standard gutter, default layout gap.
  static const double spaceMd = 16.0;

  /// 24.0 px (1.5rem) - Tablet margin, large section separation.
  static const double spaceLg = 24.0;

  /// 32.0 px (2.0rem) - Rail-to-rail vertical rhythm, hero bottom margins.
  static const double spaceXl = 32.0;

  /// 16.0 px (1.0rem) - Mobile grid gutter.
  static const double gutter = 16.0;

  /// 20.0 px (1.25rem) - Mobile screen horizontal margin.
  static const double margin = 20.0;

  /// 24.0 px (1.5rem) - Tablet screen horizontal margin.
  static const double tabletMargin = 24.0;

  /// 20.0 px (1.25rem) - Tablet grid gutter.
  static const double tabletGutter = 20.0;

  // --- EdgeInsets Shortcuts ---
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: margin,
  );
  static const EdgeInsets screenPaddingWithTop = EdgeInsets.only(
    left: margin,
    right: margin,
    top: spaceMd,
  );
  static const EdgeInsets tabletScreenPadding = EdgeInsets.symmetric(
    horizontal: tabletMargin,
  );

  static const EdgeInsets paddingXs = EdgeInsets.all(spaceXs);
  static const EdgeInsets paddingSm = EdgeInsets.all(spaceSm);
  static const EdgeInsets paddingMd = EdgeInsets.all(spaceMd);
  static const EdgeInsets paddingLg = EdgeInsets.all(spaceLg);
  static const EdgeInsets paddingXl = EdgeInsets.all(spaceXl);

  // --- SizedBox Vertical Spacers ---
  static const SizedBox verticalXs = SizedBox(height: spaceXs);
  static const SizedBox verticalSm = SizedBox(height: spaceSm);
  static const SizedBox verticalMd = SizedBox(height: spaceMd);
  static const SizedBox verticalLg = SizedBox(height: spaceLg);
  static const SizedBox verticalXl = SizedBox(height: spaceXl);

  // --- SizedBox Horizontal Spacers ---
  static const SizedBox horizontalXs = SizedBox(width: spaceXs);
  static const SizedBox horizontalSm = SizedBox(width: spaceSm);
  static const SizedBox horizontalMd = SizedBox(width: spaceMd);
  static const SizedBox horizontalLg = SizedBox(width: spaceLg);
  static const SizedBox horizontalXl = SizedBox(width: spaceXl);
}
