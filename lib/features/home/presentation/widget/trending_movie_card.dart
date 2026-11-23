import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';
import 'package:movies_4_all/features/trending_movies/domain/entity/trending_movie_entity.dart';
import 'package:sizer/sizer.dart';

class TrendingMovieCard extends StatelessWidget {
  final TrendingMovieEntity movie;
  final VoidCallback? onTap;

  const TrendingMovieCard({
    super.key,
    required this.movie,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final env = dotenv.env['TMDB_IMG_URL_W500'];
    final posterUrl = movie.posterPath != null
        ? '$env${movie.posterPath}'
        : null;

    return Container(
      height: 50.h,
      width: 88.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: AppBorderRadius.lg,
        border: Border.all(color: AppColors.hairlineWhite, width: 1.0),
        boxShadow: const [AppShadows.ambientUltraviolet],
        image: posterUrl != null
            ? DecorationImage(
                image: NetworkImage(posterUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        children: [
          // Degradado HeroOverlay para una transición fluida hacia el canvas obsidian
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.lg,
                gradient: AppGradients.heroOverlay,
              ),
            ),
          ),

          // Contenedor dinámico inferior con título, año y descripción
          Positioned(
            left: AppSpacing.spaceMd,
            right: AppSpacing.spaceMd,
            bottom: AppSpacing.spaceMd,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        movie.title,
                        style: AppTypography.headlineLg.copyWith(
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (movie.releaseDate != null) ...[
                      AppSpacing.horizontalSm,
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppSpacing.spaceXs,
                        ),
                        child: Text(
                          '(${movie.releaseDate!.year})',
                          style: AppTypography.headlineMd.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                AppSpacing.verticalSm,
                Text(
                  movie.overview,
                  softWrap: true,
                  style: AppTypography.bodyMd.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Capa táctil interactiva
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: AppBorderRadius.lg,
                splashColor: AppColors.electricUltraviolet.withValues(alpha: 0.2),
                highlightColor: AppColors.electricUltraviolet.withValues(alpha: 0.1),
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
