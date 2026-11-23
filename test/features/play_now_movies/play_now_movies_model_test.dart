import 'package:flutter_test/flutter_test.dart';
import 'package:movies_4_all/features/play_now_movies/data/models/play_now_movies_model.dart';

void main() {
  const json = {
    'dates': {'maximum': '2023-05-03', 'minimum': '2023-03-16'},
    'page': 1,
    'results': [
      {
        'adult': false,
        'backdrop_path': '/iJQIbOPm81fPEGKt5BPuZmfnA54.jpg',
        'genre_ids': [16, 12, 10751, 14, 35],
        'id': 502356,
        'original_language': 'en',
        'original_title': 'The Super Mario Bros. Movie',
        'overview': 'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
        'popularity': 6572.614,
        'poster_path': '/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg',
        'release_date': '2023-04-05',
        'title': 'The Super Mario Bros. Movie',
        'video': false,
        'vote_average': 7.5,
        'vote_count': 1456,
      },
      {
        'adult': false,
        'backdrop_path': '/54IXMMEQKlkPXHqPExWy98UBmtE.jpg',
        'genre_ids': [27],
        'id': 1008005,
        'original_language': 'es',
        'original_title': 'La niña de la comunión',
        'overview': 'Spain, late 1980s. Newcomer Sara tries to fit in with the other teens in this tight-knit small town in the province of Tarragona.',
        'popularity': 1154.3,
        'poster_path': '/sP6AO11a7jWgsmT9T8j9EGIWAaZ.jpg',
        'release_date': '2023-02-10',
        'title': 'The Communion Girl',
        'video': false,
        'vote_average': 6.5,
        'vote_count': 58,
      },
    ],
    'total_pages': 87,
    'total_results': 1734,
  };

  group('PlayNowMoviesModel', () {
    test('parses the now playing movies response', () {
      final response = PlayNowMoviesModel.fromJson(json);

      expect(response.dates?.maximum, '2023-05-03');
      expect(response.dates?.minimum, '2023-03-16');
      expect(response.page, 1);
      expect(response.totalPages, 87);
      expect(response.totalResults, 1734);
      expect(response.results, hasLength(2));

      final first = response.results.first;
      expect(first.id, 502356);
      expect(first.title, 'The Super Mario Bros. Movie');
      expect(first.genreIds, [16, 12, 10751, 14, 35]);
      expect(first.popularity, 6572.614);
      expect(first.voteAverage, 7.5);
      expect(first.voteCount, 1456);
      expect(first.releaseDate, DateTime(2023, 4, 5));

      final second = response.results.last;
      expect(second.id, 1008005);
      expect(second.originalLanguage, 'es');
      expect(second.originalTitle, 'La niña de la comunión');
      expect(second.title, 'The Communion Girl');
      expect(second.genreIds, [27]);
      expect(second.releaseDate, DateTime(2023, 2, 10));
    });

    test('round trips through toJson', () {
      final response = PlayNowMoviesModel.fromJson(json);

      expect(response.toJson(), json);
    });
  });
}
