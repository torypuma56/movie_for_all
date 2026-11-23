import 'package:flutter_test/flutter_test.dart';
import 'package:movies_4_all/features/trending_movies/data/models/trending_movie_model.dart';
import 'package:movies_4_all/features/trending_movies/data/models/trending_movies_model.dart';
import 'package:movies_4_all/features/trending_movies/domain/entity/trending_movies_entity.dart';

void main() {
  const json = {
    'page': 1,
    'results': [
      {
        'adult': false,
        'backdrop_path': '/44immBwzhDVyjn87b3x3l9mlhAD.jpg',
        'id': 934433,
        'title': 'Scream VI',
        'original_language': 'en',
        'original_title': 'Scream VI',
        'overview': 'Following the latest Ghostface killings, the four survivors leave Woodsboro behind and start a fresh chapter.',
        'poster_path': '/wDWwtvkRRlgTiUr6TyLSMX8FCuZ.jpg',
        'media_type': 'movie',
        'genre_ids': [27, 9648, 53],
        'popularity': 609.941,
        'release_date': '2023-03-08',
        'video': false,
        'vote_average': 7.374,
        'vote_count': 684,
      },
      {
        'adult': false,
        'backdrop_path': '/iJQIbOPm81fPEGKt5BPuZmfnA54.jpg',
        'id': 502356,
        'title': 'The Super Mario Bros. Movie',
        'original_language': 'en',
        'original_title': 'The Super Mario Bros. Movie',
        'overview': 'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
        'poster_path': '/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg',
        'media_type': 'movie',
        'genre_ids': [16, 12, 10751, 14, 35],
        'popularity': 7212.464,
        'release_date': '2023-04-05',
        'video': false,
        'vote_average': 7.51,
        'vote_count': 1452,
      },
    ],
    'total_pages': 1000,
    'total_results': 20000,
  };

  group('TrendingMoviesModel', () {
    test('parses the trending movies response', () {
      final response = TrendingMoviesModel.fromJson(json);

      expect(response.page, 1);
      expect(response.totalPages, 1000);
      expect(response.totalResults, 20000);
      expect(response.results, hasLength(2));

      final first = response.results.first;
      expect(first.id, 934433);
      expect(first.title, 'Scream VI');
      expect(first.mediaType, 'movie');
      expect(first.genreIds, [27, 9648, 53]);
      expect(first.popularity, 609.941);
      expect(first.voteAverage, 7.374);
      expect(first.voteCount, 684);
      expect(first.releaseDate, DateTime(2023, 3, 8));

      final second = response.results.last;
      expect(second.id, 502356);
      expect(second.title, 'The Super Mario Bros. Movie');
      expect(second.originalTitle, 'The Super Mario Bros. Movie');
      expect(second.genreIds, [16, 12, 10751, 14, 35]);
      expect(second.popularity, 7212.464);
      expect(second.voteCount, 1452);
      expect(second.releaseDate, DateTime(2023, 4, 5));
    });

    test('round trips through toJson', () {
      final response = TrendingMoviesModel.fromJson(json);

      expect(response.toJson(), json);
    });
  });

  group('entity conversion', () {
    test('converts to a pure entity tree', () {
      final entity = TrendingMoviesModel.fromJson(json).toEntity();

      expect(entity, isA<TrendingMoviesEntity>());
      expect(entity, isNot(isA<TrendingMoviesModel>()));
      expect(entity.results.first, isNot(isA<TrendingMovieModel>()));
    });

    test('preserves values in the entity', () {
      final model = TrendingMoviesModel.fromJson(json);
      final entity = model.toEntity();

      expect(entity.page, model.page);
      expect(entity.totalPages, model.totalPages);
      expect(entity.totalResults, model.totalResults);
      expect(entity.results.first.id, 934433);
      expect(entity.results.first.title, 'Scream VI');
      expect(entity.results.first.genreIds, [27, 9648, 53]);
      expect(entity.results.first.releaseYear, 2023);
    });

    test('round trips through fromEntity', () {
      final entity = TrendingMoviesModel.fromJson(json).toEntity();
      final model = TrendingMoviesModel.fromEntity(entity);

      expect(model, isA<TrendingMoviesModel>());
      expect(model.toJson(), json);
    });
  });

  group('value semantics', () {
    test('entities with the same values are equal', () {
      final a = TrendingMoviesModel.fromJson(json).toEntity();
      final b = TrendingMoviesModel.fromJson(json).toEntity();

      expect(a, equals(b));
      expect(a.hashCode, b.hashCode);
    });

    test('changing a field breaks equality', () {
      final a = TrendingMoviesModel.fromJson(json).toEntity();
      final b = a.copyWith(page: 2);

      expect(a, isNot(equals(b)));
    });

    test('model equals its entity', () {
      final model = TrendingMoviesModel.fromJson(json);

      expect(model, equals(model.toEntity()));
    });

    test('copyWith only changes the given fields', () {
      final entity = TrendingMoviesModel.fromJson(json).toEntity();
      final copy = entity.copyWith(page: 5, totalPages: 40);

      expect(copy.page, 5);
      expect(copy.totalPages, 40);
      expect(copy.totalResults, entity.totalResults);
      expect(copy.results.first, entity.results.first);
      expect(copy, isNot(equals(entity)));
    });
  });
}
