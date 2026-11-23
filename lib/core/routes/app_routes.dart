import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_4_all/features/home/presentation/pages/home_page.dart';
import 'package:movies_4_all/features/movie_details/presentation/pages/movie_details_page.dart';
import 'package:movies_4_all/features/series/presentation/pages/series_page.dart';
import 'package:movies_4_all/features/series_details/presentation/pages/series_details_page.dart';
import 'package:movies_4_all/features/trending_movies/presentation/pages/trending_movie_page.dart';

class AppRoutes {
  static String home = '/';
  static String movieDetails = '/movie-details/:id';
  static String seriesDetails = '/series-details/:id';
  static String series = '/series';
  static String trendingMovies = '/trending-movies';

  static String movieDetailsPath(int id) => '/movie-details/$id';
  static String seriesDetailsPath(int id) => '/series-details/$id';

  static GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        path: movieDetails,
        pageBuilder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return MaterialPage(child: MovieDetailsPage(id: id));
        },
      ),
      GoRoute(
        path: seriesDetails,
        pageBuilder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return MaterialPage(child: SeriesDetailsPage(id: id));
        },
      ),
      GoRoute(
        path: series,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SeriesPage());
        },
      ),
      GoRoute(
        path: trendingMovies,
        pageBuilder: (context, state) {
          return const MaterialPage(child: TrendingMoviesPage());
        },
      ),
    ],
  );
}
