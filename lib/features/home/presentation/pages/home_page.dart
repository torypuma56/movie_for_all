import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_4_all/core/routes/app_routes.dart';
import 'package:movies_4_all/core/theme/app_theme.dart';
import 'package:movies_4_all/core/widgets/app_logo.dart';
import 'package:movies_4_all/features/home/presentation/providers/home_provider.dart';
import 'package:movies_4_all/features/home/presentation/widget/play_now_movie_card.dart';
import 'package:movies_4_all/features/home/presentation/widget/section_title_widget.dart';
import 'package:movies_4_all/features/home/presentation/widget/serie_card.dart';
import 'package:movies_4_all/features/home/presentation/widget/trending_movie_card.dart';
import 'package:sizer/sizer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(homeNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.baseObsidian,
      body: SafeArea(
        child: info.when(
          data: (homeState) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.verticalMd,

                // Logo y nombre de la app
                Padding(
                  padding: AppSpacing.screenPadding,
                  child: Row(
                    children: [
                      const AppLogo(),
                      AppSpacing.horizontalSm,
                      Text(
                        'Movie 4 All',
                        style: AppTypography.headlineLgMobile.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),

                AppSpacing.verticalMd,

                // Encabezado de Sección: "Tendencias"
                Padding(
                  padding: AppSpacing.screenPadding,
                  child: SectionTitleWidget(
                    title: 'Tendencias',
                    indicatorColor: Colors.redAccent,
                    onTap: () {
                      debugPrint('Ver todas las tendencias');
                    },
                  ),
                ),

                AppSpacing.verticalSm,

                // Tarjeta principal Hero: Película en Tendencia
                Center(
                  child: TrendingMovieCard(
                    movie: homeState.trendingMovie,
                    onTap: () {
                      context.push(
                        AppRoutes.movieDetailsPath(homeState.trendingMovie.id),
                      );
                    },
                  ),
                ),

                AppSpacing.verticalLg,

                // Sección: "En Cartelera" (se oculta si no hay datos)
                if (homeState.playNowMovies.isNotEmpty) ...[
                  Padding(
                    padding: AppSpacing.screenPadding,
                    child: SectionTitleWidget(
                      title: 'En Cartelera',
                      onTap: () {
                        debugPrint('Ver todas las películas en cartelera');
                      },
                    ),
                  ),

                  AppSpacing.verticalSm,

                  // Carrusel horizontal de tarjetas PlayNowMovieCard
                  SizedBox(
                    height: 31.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: AppSpacing.screenPadding,
                      itemCount: homeState.playNowMovies.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppSpacing.spaceMd),
                      itemBuilder: (context, index) {
                        final movie = homeState.playNowMovies[index];
                        return PlayNowMovieCard(
                          movie: movie,
                          onTap: () {
                            context.push(AppRoutes.movieDetailsPath(movie.id));
                          },
                        );
                      },
                    ),
                  ),

                  AppSpacing.verticalLg,
                ],

                // Sección: "Mejor Valoradas" (se oculta si no hay datos)
                if (homeState.topRatedMovies.isNotEmpty) ...[
                  Padding(
                    padding: AppSpacing.screenPadding,
                    child: SectionTitleWidget(
                      title: 'Mejor Valoradas',
                      indicatorColor: AppColors.vividEmeraldLime,
                      onTap: () {
                        debugPrint('Ver todas las mejor valoradas');
                      },
                    ),
                  ),

                  AppSpacing.verticalSm,

                  // Carrusel horizontal de tarjetas Top Rated
                  SizedBox(
                    height: 31.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: AppSpacing.screenPadding,
                      itemCount: homeState.topRatedMovies.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppSpacing.spaceMd),
                      itemBuilder: (context, index) {
                        final movie = homeState.topRatedMovies[index];
                        return PlayNowMovieCard(
                          trMovie: movie,
                          onTap: () {
                            context.push(AppRoutes.movieDetailsPath(movie.id));
                          },
                        );
                      },
                    ),
                  ),

                  AppSpacing.verticalLg,
                ],

                // Sección: "Series Populares" (se oculta si no hay datos)
                if (homeState.popularSeries.isNotEmpty) ...[
                  Padding(
                    padding: AppSpacing.screenPadding,
                    child: SectionTitleWidget(
                      title: 'Series Populares',
                      indicatorColor: AppColors.brightHeliotrope,
                      onTap: () {
                        debugPrint('Ver todas las series populares');
                      },
                    ),
                  ),

                  AppSpacing.verticalSm,

                  SizedBox(
                    height: 31.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: AppSpacing.screenPadding,
                      itemCount: homeState.popularSeries.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppSpacing.spaceMd),
                      itemBuilder: (context, index) {
                        final serie = homeState.popularSeries[index];
                        return SerieCard(
                          serie: serie,
                          onTap: () {
                            context.push(AppRoutes.seriesDetailsPath(serie.id));
                          },
                        );
                      },
                    ),
                  ),

                  AppSpacing.verticalLg,
                ],

                // Sección: "Series en Emisión" (se oculta si no hay datos)
                if (homeState.onAirSeries.isNotEmpty) ...[
                  Padding(
                    padding: AppSpacing.screenPadding,
                    child: SectionTitleWidget(
                      title: 'Series en Emisión',
                      indicatorColor: Colors.amber,
                      onTap: () {
                        debugPrint('Ver todas las series en emisión');
                      },
                    ),
                  ),

                  AppSpacing.verticalSm,

                  SizedBox(
                    height: 31.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: AppSpacing.screenPadding,
                      itemCount: homeState.onAirSeries.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppSpacing.spaceMd),
                      itemBuilder: (context, index) {
                        final serie = homeState.onAirSeries[index];
                        return SerieCard(
                          serie: serie,
                          onTap: () {
                            context.push(AppRoutes.seriesDetailsPath(serie.id));
                          },
                        );
                      },
                    ),
                  ),

                  AppSpacing.verticalLg,
                ],

                // Sección: "Top Series" (se oculta si no hay datos)
                if (homeState.topSeries.isNotEmpty) ...[
                  Padding(
                    padding: AppSpacing.screenPadding,
                    child: SectionTitleWidget(
                      title: 'Top Series',
                      onTap: () {
                        debugPrint('Ver todas las top series');
                      },
                    ),
                  ),

                  AppSpacing.verticalSm,

                  SizedBox(
                    height: 31.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: AppSpacing.screenPadding,
                      itemCount: homeState.topSeries.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppSpacing.spaceMd),
                      itemBuilder: (context, index) {
                        final serie = homeState.topSeries[index];
                        return SerieCard(
                          serie: serie,
                          rank: index + 1,
                          onTap: () {
                            context.push(AppRoutes.seriesDetailsPath(serie.id));
                          },
                        );
                      },
                    ),
                  ),

                  AppSpacing.verticalLg,
                ],
              ],
            ),
          ),
          error: (err, stack) => Center(
            child: Padding(
              padding: AppSpacing.paddingLg,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.error_outline_rounded,
                    color: AppColors.error,
                    size: 48.0,
                  ),
                  AppSpacing.verticalMd,
                  Text(
                    'No se pudieron cargar los contenidos:\n$err',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyMd.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  AppSpacing.verticalMd,
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.electricUltraviolet,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.spaceLg,
                        vertical: AppSpacing.spaceSm + 4,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppBorderRadius.full,
                      ),
                    ),
                    onPressed: () => ref.invalidate(homeNotifierProvider),
                    icon: const Icon(Icons.refresh_rounded),
                    label: Text(
                      'Reintentar',
                      style: AppTypography.labelMd.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: AppColors.electricUltraviolet,
            ),
          ),
        ),
      ),
    );
  }
}
