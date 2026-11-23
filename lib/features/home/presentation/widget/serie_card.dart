import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';
import 'package:movies_4_all/features/series/domain/entities/serie_entity.dart';
import 'package:sizer/sizer.dart';

/// Tarjeta de poster para secciones de series del home.
///
/// Muestra el póster a sangre con degradados de legibilidad,
/// calificación con estrella arriba a la derecha y nombre + año
/// de estreno abajo. Opcionalmente muestra la insignia TOP #n.
class SerieCard extends StatelessWidget {
  final SerieEntity serie;
  final VoidCallback? onTap;
  final int? rank;
  final double? width;
  final double? height;

  const SerieCard({
    super.key,
    required this.serie,
    this.onTap,
    this.rank,
    this.width,
    this.height,
  });

  bool get _shouldShowTop => rank != null && rank! > 0;

  @override
  Widget build(BuildContext context) {
    final env = dotenv.env['TMDB_IMG_URL_W500'];
    final posterUrl = serie.posterPath != null
        ? '$env${serie.posterPath}'
        : null;

    final cardWidth = width ?? 45.w;
    final cardHeight = height ?? 30.h;

    return Container(
      width: cardWidth,
      height: cardHeight,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppBorderRadius.lg,
        border: Border.all(color: AppColors.hairlineWhite, width: 1.0),
        boxShadow: const [AppShadows.ambientUltraviolet],
        image: posterUrl != null
            ? DecorationImage(image: NetworkImage(posterUrl), fit: BoxFit.fill)
            : null,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.lg,
                gradient: AppGradients.posterBottomScrim,
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: cardHeight * 0.3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.lg,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black54,
                    Colors.black12,
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.55, 1.0],
                ),
              ),
            ),
          ),

          if (_shouldShowTop)
            Positioned(
              top: AppSpacing.spaceSm,
              left: AppSpacing.spaceSm,
              child: _buildTopBadge(),
            ),

          Positioned(
            top: AppSpacing.spaceSm,
            right: AppSpacing.spaceSm,
            child: _buildRatingBadge(),
          ),

          Positioned(
            left: AppSpacing.spaceSm,
            right: AppSpacing.spaceSm,
            bottom: AppSpacing.spaceSm,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serie.name,
                  style: AppTypography.headlineMd.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                if (serie.firstAirDate != null) ...[
                  AppSpacing.verticalXs,
                  Text(
                    '${serie.firstAirYear}',
                    style: AppTypography.bodySm.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),

          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: AppBorderRadius.lg,
                splashColor: AppColors.electricUltraviolet.withValues(
                  alpha: 0.2,
                ),
                highlightColor: AppColors.electricUltraviolet.withValues(
                  alpha: 0.1,
                ),
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBadge() {
    return Container(
      padding: AppSpacing.paddingSm,
      decoration: BoxDecoration(
        gradient: AppGradients.playAction,
        borderRadius: AppBorderRadius.sm,
        boxShadow: const [AppShadows.playButtonGlow],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'TOP',
            style: AppTypography.labelSm.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          AppSpacing.horizontalXs,
          Text(
            '#$rank',
            style: AppTypography.labelSm.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBadge() {
    return Container(
      padding: AppSpacing.paddingSm,
      decoration: AppGlassDecorations.scoreChip,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star_rounded,
            color: AppColors.vividEmeraldLime,
            size: AppSpacing.spaceMd - 2,
          ),
          AppSpacing.horizontalXs,
          Text(
            serie.voteAverage.toStringAsFixed(1),
            style: AppTypography.badgeScore,
          ),
        ],
      ),
    );
  }
}
