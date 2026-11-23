import 'package:flutter/material.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';

/// Chip de información acotado al ancho disponible (evita RightOverflow).
class InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final int maxLines;
  final Color? iconColor;

  const InfoChip({
    super.key,
    required this.icon,
    required this.label,
    this.maxLines = 1,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.spaceSm + 2,
              vertical: AppSpacing.spaceXs + 2,
            ),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: AppBorderRadius.full,
              border: Border.all(color: AppColors.hairlineWhite),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: AppSpacing.spaceMd - 2,
                  color: iconColor ?? AppColors.electricUltraviolet,
                ),
                AppSpacing.horizontalXs,
                Flexible(
                  child: Text(
                    label,
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodySm.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
