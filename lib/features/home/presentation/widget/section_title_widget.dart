import 'package:flutter/material.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';
import 'package:sizer/sizer.dart';

/// Encabezado reutilizable para las secciones de la app (ej. "En Cartelera", "Tendencias").
/// Utiliza los tokens de color, tipografía y bordes de Obsidian Lumina.
class SectionTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final String actionTitle;
  final Color? indicatorColor;

  const SectionTitleWidget({
    super.key,
    required this.title,
    this.onTap,
    this.actionTitle = 'Ver todos',
    this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = indicatorColor ?? AppColors.electricUltraviolet;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                height: 2.2.h,
                width: AppSpacing.spaceXs / 2,
                decoration: BoxDecoration(
                  color: effectiveColor,
                  borderRadius: AppBorderRadius.full,
                  boxShadow: [
                    BoxShadow(
                      color: effectiveColor.withValues(alpha: 0.5),
                      blurRadius: 6,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
              AppSpacing.horizontalSm,
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.headlineMd.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        if (onTap != null) ...[
          AppSpacing.horizontalSm,
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.spaceSm,
                vertical: AppSpacing.spaceXs,
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              actionTitle,
              style: AppTypography.labelMd.copyWith(
                color: AppColors.electricUltraviolet,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
