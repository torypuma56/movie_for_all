import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';
import 'package:movies_4_all/core/widgets/app_logo.dart';
import 'package:movies_4_all/core/widgets/info_chip.dart';
import 'package:movies_4_all/features/movie_details/presentation/widgets/cast_list_widget.dart';
import 'package:movies_4_all/features/series_details/presentation/providers/series_details_provider.dart';
import 'package:movies_4_all/features/series_details/presentation/widgets/head_image_serie.dart';

class SeriesDetailsPage extends ConsumerWidget {
  final int id;
  const SeriesDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsSeriesAsync = ref.watch(seriesDetailsNotifierProvider(id));
    return detailsSeriesAsync.when(
      data: (data) {
        final serie = data.serieDetails;
        final imagePath = serie.backdropPath ?? serie.posterPath;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () => context.pop(),
            ),
            title: const AppLogo(size: AppSpacing.spaceLg),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (imagePath != null)
                  HeadImageSerie(
                    imagePath: imagePath,
                    genres: serie.genres,
                    title: serie.name,
                  )
                else
                  const SizedBox(height: AppSpacing.spaceXl * 6),
                Padding(
                  padding: AppSpacing.screenPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        serie.name,
                        style: AppTypography.headlineLgMobile,
                      ),
                      if (serie.tagline != null &&
                          serie.tagline!.isNotEmpty) ...[
                        AppSpacing.verticalXs,
                        Text(
                          serie.tagline!,
                          style: AppTypography.bodyMd.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                      AppSpacing.verticalSm,
                      Wrap(
                        spacing: AppSpacing.spaceSm,
                        runSpacing: AppSpacing.spaceSm,
                        children: [
                          InfoChip(
                            icon: Icons.star_rounded,
                            label:
                                '${serie.voteAverage.toStringAsFixed(1)} · ${serie.voteCount}',
                          ),
                          if (serie.firstAirYear != null)
                            InfoChip(
                              icon: Icons.calendar_today_rounded,
                              label: '${serie.firstAirYear}',
                            ),
                          InfoChip(
                            icon: Icons.live_tv_rounded,
                            label: serie.status,
                          ),
                          InfoChip(
                            icon: Icons.movie_filter_rounded,
                            label:
                                '${serie.numberOfSeasons} temporadas · ${serie.numberOfEpisodes} episodios',
                          ),
                        ],
                      ),
                      if (serie.networks.isNotEmpty) ...[
                        AppSpacing.verticalSm,
                        Text(
                          'Plataformas',
                          style: AppTypography.titleMd.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        AppSpacing.verticalSm,
                        Wrap(
                          spacing: AppSpacing.spaceSm,
                          runSpacing: AppSpacing.spaceSm,
                          children: serie.networks
                              .map(
                                (network) => InfoChip(
                                  icon: Icons.satellite_alt_rounded,
                                  label: network.name,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                      AppSpacing.verticalMd,
                      Text(
                        serie.overview,
                        style: AppTypography.bodyMd.copyWith(
                          height: 1.5,
                        ),
                      ),
                      AppSpacing.verticalMd,
                      CastListWidget(cast: data.cast),
                      if (serie.createdBy.isNotEmpty) ...[
                        AppSpacing.verticalMd,
                        Text(
                          'Creado por',
                          style: AppTypography.titleMd.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        AppSpacing.verticalSm,
                        Text(
                          serie.createdBy.map((c) => c.name).join(', '),
                          style: AppTypography.bodyMd,
                        ),
                      ],
                      if (serie.seasons.isNotEmpty) ...[
                        AppSpacing.verticalMd,
                        Text(
                          'Temporadas',
                          style: AppTypography.titleMd.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        AppSpacing.verticalSm,
                        ...serie.seasons.map(
                          (season) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppSpacing.spaceSm,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        season.name,
                                        style: AppTypography.titleMd,
                                      ),
                                      if (season.overview.isNotEmpty) ...[
                                        AppSpacing.verticalXs,
                                        Text(
                                          season.overview,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTypography.bodySm,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                AppSpacing.horizontalSm,
                                Text(
                                  '${season.episodeCount} ep.',
                                  style: AppTypography.bodySm.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      AppSpacing.verticalLg,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () => context.pop(),
            ),
            title: const AppLogo(size: AppSpacing.spaceLg),
          ),
          body: Center(
            child: Padding(
              padding: AppSpacing.paddingLg,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.warning_amber,
                    size: 48,
                    color: AppColors.error,
                  ),
                  AppSpacing.verticalMd,
                  Text(
                    'No series found: $error',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyMd,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
