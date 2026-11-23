class EndPoints {
  const EndPoints._();

  static const String playNowMoviesUrl = '/movie/now_playing';
  static const String topRatedMoviesUrl = '/movie/top_rated';
  static const String popularSeriesUrl = '/tv/popular';
  static const String onAirSeriesUrl = '/tv/on_the_air';
  static const String topRatedSeriesUrl = '/tv/top_rated';
  static String trendingMoviesUrl(String timeWindow) =>
      '/trending/movie/$timeWindow';
  static String movieDetails(int id) => '/movie/$id';
  static String movieCredits(int id) => '/movie/$id/credits';
  static String seriesDetails(int id) => '/tv/$id';
  static String seriesCredits(int id) => '/tv/$id/credits';
}
