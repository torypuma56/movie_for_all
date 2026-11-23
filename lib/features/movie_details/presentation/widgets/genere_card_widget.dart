import 'package:flutter/material.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';

class GenreCardWidget extends StatelessWidget {
  final String genreName;
  const GenreCardWidget({super.key, required this.genreName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.paddingSm,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.full,
        border: Border.all(color: Colors.white, width: 1.5),
        color: Colors.black.withValues(alpha: 0.35),
      ),
      child: Text(
        genreName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTypography.labelSm.copyWith(color: Colors.white),
      ),
    );
  }
}
