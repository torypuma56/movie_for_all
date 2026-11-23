import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';
import 'package:movies_4_all/core/widgets/app_logo.dart';
import 'package:movies_4_all/core/widgets/info_chip.dart';
import 'package:movies_4_all/features/movie_details/presentation/providers/movie_details_provider.dart';
import 'package:movies_4_all/features/movie_details/presentation/widgets/cast_list_widget.dart';
import 'package:movies_4_all/features/movie_details/presentation/widgets/head_image_movie.dart';

class MovieDetailsPage extends ConsumerWidget {
  final int id;
  const MovieDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsMoviesAsync = ref.watch(movieDetailsNotifierProvider(id));
    return detailsMoviesAsync.when(
      data: (data) {
        final movie = data.movieDetails;
        final genres = data.genres;
        final imagePath = movie.backdropPath ?? movie.posterPath;
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
                  HeadImageMovie(
                    imagePath: imagePath,
                    genres: genres,
                    title: movie.title,
                  )
                else
                  const SizedBox(height: AppSpacing.spaceXl * 6),
                Padding(
                  padding: AppSpacing.paddingMd,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title, style: AppTypography.headlineLgMobile),
                      if (movie.tagline != null &&
                          movie.tagline!.isNotEmpty) ...[
                        AppSpacing.verticalXs,
                        Text(
                          movie.tagline!,
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
                            iconColor: const Color.fromARGB(255, 237, 253, 12),
                            label:
                                '${movie.voteAverage.toStringAsFixed(1)} · ${movie.voteCount}',
                          ),
                          if (movie.releaseYear != null)
                            InfoChip(
                              icon: Icons.calendar_today_rounded,
                              label: '${movie.releaseYear}',
                            ),
                          InfoChip(
                            icon: Icons.schedule_rounded,
                            label: movie.runtime != null
                                ? '${movie.runtime} min'
                                : movie.status,
                          ),
                          ...movie.originCountry.map(
                            (country) => InfoChip(
                              icon: Icons.public_rounded,
                              label: country,
                            ),
                          ),
                        ],
                      ),
                      if (movie.productionCompanies.isNotEmpty) ...[
                        AppSpacing.verticalSm,
                        Text(
                          'Productoras',
                          style: AppTypography.titleMd.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        AppSpacing.verticalSm,
                        Wrap(
                          spacing: AppSpacing.spaceSm,
                          runSpacing: AppSpacing.spaceSm,
                          children: movie.productionCompanies
                              .map(
                                (company) => InfoChip(
                                  icon: Icons.business_rounded,
                                  label: company.name,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                      AppSpacing.verticalMd,
                      Text(
                        movie.overview,
                        style: AppTypography.bodyMd.copyWith(height: 1.5),
                      ),
                      AppSpacing.verticalMd,
                      CastListWidget(cast: data.cast),
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
                    'No movie found: $error',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyMd,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
