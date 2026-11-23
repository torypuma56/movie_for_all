import 'package:flutter/material.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({super.key, this.size = AppSpacing.spaceXl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppBorderRadius.sm,
      child: Image.asset(
        'assets/icons/icon.png',
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            gradient: AppGradients.playAction,
            borderRadius: AppBorderRadius.sm,
            boxShadow: const [AppShadows.playButtonGlow],
          ),
          child: const Icon(
            Icons.movie_rounded,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
