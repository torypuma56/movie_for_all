import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';
import 'package:movies_4_all/features/play_now_movies/domain/entities/play_now_movie_entity.dart';
import 'package:movies_4_all/features/top_rated_movies/domain/entities/top_rated_movie_entity.dart';
import 'package:sizer/sizer.dart';

/// Tarjeta de poster reutilizable para las secciones "En Cartelera" y
/// "Mejor Valoradas". Acepta [movie] (play now) o [trMovie] (top rated).
///
/// Muestra el póster a sangre con degradados de legibilidad,
/// calificación con estrella arriba a la derecha y título + año abajo.
class PlayNowMovieCard extends StatelessWidget {
  final PlayNowMovieEntity? movie;
  final TopRatedMovieEntity? trMovie;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const PlayNowMovieCard({
    super.key,
    this.movie,
    this.trMovie,
    this.onTap,
    this.width,
    this.height,
  });

  String? get _posterPath => movie?.posterPath ?? trMovie?.posterPath;
  String get _title => movie?.title ?? trMovie?.title ?? '';
  double get _voteAverage => movie?.voteAverage ?? trMovie?.voteAverage ?? 0;
  DateTime? get _releaseDate => movie?.releaseDate ?? trMovie?.releaseDate;

  @override
  Widget build(BuildContext context) {
    final env = dotenv.env['TMDB_IMG_URL_W500'];
    final posterUrl = _posterPath != null ? '$env$_posterPath' : null;

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
                  colors: [Colors.black54, Colors.black12, Colors.transparent],
                  stops: [0.0, 0.55, 1.0],
                ),
              ),
            ),
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
                  _title,
                  style: AppTypography.headlineMd.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                if (_releaseDate != null) ...[
                  AppSpacing.verticalXs,
                  Text(
                    '${_releaseDate!.year}',
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
            _voteAverage.toStringAsFixed(1),
            style: AppTypography.badgeScore,
          ),
        ],
      ),
    );
  }
}
