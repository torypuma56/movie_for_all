import 'package:flutter_test/flutter_test.dart';
import 'package:movies_4_all/features/movie_details/data/models/belongs_to_collection_model.dart';
import 'package:movies_4_all/features/movie_details/data/models/genre_model.dart';
import 'package:movies_4_all/features/movie_details/data/models/movie_details_model.dart';
import 'package:movies_4_all/features/movie_details/data/models/production_company_model.dart';
import 'package:movies_4_all/features/movie_details/data/models/production_country_model.dart';
import 'package:movies_4_all/features/movie_details/data/models/spoken_language_model.dart';
import 'package:movies_4_all/features/movie_details/domain/entities/movie_details_entity.dart';

void main() {
  const json = {
    'adult': false,
    'backdrop_path': '/2w4xG178RpB4MDAIfTkqAuSJzec.jpg',
    'belongs_to_collection': {
      'id': 10,
      'name': 'Star Wars Collection',
      'poster_path': '/pWVLFh4OuejTpUaDQbB1C4zoS2p.jpg',
      'backdrop_path': '/iY2ujEY2m68OTTlPFTiHub9joHS.jpg',
    },
    'budget': 11000000,
    'genres': [
      {'id': 12, 'name': 'Adventure'},
      {'id': 28, 'name': 'Action'},
      {'id': 878, 'name': 'Science Fiction'},
    ],
    'homepage': 'http://www.starwars.com/films/star-wars-episode-iv-a-new-hope',
    'id': 11,
    'imdb_id': 'tt0076759',
    'origin_country': ['US'],
    'original_language': 'en',
    'original_title': 'Star Wars',
    'overview': 'Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.',
    'popularity': 20.6912,
    'poster_path': '/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg',
    'production_companies': [
      {
        'id': 1,
        'logo_path': '/tlVSws0RvvtPBwViUyOFAO0vcQS.png',
        'name': 'Lucasfilm Ltd.',
        'origin_country': 'US',
      },
      {
        'id': 25,
        'logo_path': '/qZCc1lty5FzX30aOCVRBLzaVmcp.png',
        'name': '20th Century Fox',
        'origin_country': 'US',
      },
    ],
    'production_countries': [
      {'iso_3166_1': 'US', 'name': 'United States of America'},
    ],
    'release_date': '1977-05-25',
    'revenue': 775398007,
    'runtime': 121,
    'spoken_languages': [
      {'english_name': 'English', 'iso_639_1': 'en', 'name': 'English'},
    ],
    'status': 'Released',
    'tagline': 'A long time ago in a galaxy far, far away...',
    'title': 'Star Wars',
    'video': false,
    'vote_average': 8.2,
    'vote_count': 22061,
  };

  group('MovieDetailsModel', () {
    test('parses the movie details response', () {
      final movie = MovieDetailsModel.fromJson(json);

      expect(movie.adult, isFalse);
      expect(movie.id, 11);
      expect(movie.title, 'Star Wars');
      expect(movie.originalTitle, 'Star Wars');
      expect(movie.originalLanguage, 'en');
      expect(movie.budget, 11000000);
      expect(movie.revenue, 775398007);
      expect(movie.runtime, 121);
      expect(movie.popularity, 20.6912);
      expect(movie.voteAverage, 8.2);
      expect(movie.voteCount, 22061);
      expect(movie.originCountry, ['US']);
      expect(movie.imdbId, 'tt0076759');
      expect(movie.status, 'Released');
      expect(movie.releaseDate, DateTime(1977, 5, 25));
      expect(movie.tagline, 'A long time ago in a galaxy far, far away...');
      expect(movie.genres.map((genre) => genre.name), [
        'Adventure',
        'Action',
        'Science Fiction',
      ]);
      expect(movie.belongsToCollection?.id, 10);
      expect(movie.belongsToCollection?.name, 'Star Wars Collection');
      expect(movie.productionCompanies.first.name, 'Lucasfilm Ltd.');
      expect(
        movie.productionCompanies.first.logoPath,
        '/tlVSws0RvvtPBwViUyOFAO0vcQS.png',
      );
      expect(movie.productionCountries.first.iso31661, 'US');
      expect(movie.spokenLanguages.first.iso6391, 'en');
    });

    test('round trips through toJson', () {
      final movie = MovieDetailsModel.fromJson(json);

      expect(movie.toJson(), json);
    });
  });

  group('entity conversion', () {
    test('converts to a pure entity tree', () {
      final entity = MovieDetailsModel.fromJson(json).toEntity();

      expect(entity, isA<MovieDetailsEntity>());
      expect(entity, isNot(isA<MovieDetailsModel>()));
      expect(entity.belongsToCollection, isNot(isA<BelongsToCollectionModel>()));
      expect(entity.genres.first, isNot(isA<GenreModel>()));
      expect(
        entity.productionCompanies.first,
        isNot(isA<ProductionCompanyModel>()),
      );
      expect(
        entity.productionCountries.first,
        isNot(isA<ProductionCountryModel>()),
      );
      expect(entity.spokenLanguages.first, isNot(isA<SpokenLanguageModel>()));
    });

    test('preserves values in the entity', () {
      final model = MovieDetailsModel.fromJson(json);
      final entity = model.toEntity();

      expect(entity.id, model.id);
      expect(entity.title, model.title);
      expect(entity.overview, model.overview);
      expect(entity.releaseDate, model.releaseDate);
      expect(entity.releaseYear, 1977);
      expect(entity.genres.map((genre) => genre.name), [
        'Adventure',
        'Action',
        'Science Fiction',
      ]);
      expect(entity.belongsToCollection?.name, 'Star Wars Collection');
      expect(entity.productionCompanies.first.name, 'Lucasfilm Ltd.');
      expect(entity.productionCountries.first.iso31661, 'US');
      expect(entity.spokenLanguages.first.iso6391, 'en');
    });

    test('round trips through fromEntity', () {
      final entity = MovieDetailsModel.fromJson(json).toEntity();
      final model = MovieDetailsModel.fromEntity(entity);

      expect(model, isA<MovieDetailsModel>());
      expect(model.toJson(), json);
    });
  });

  group('value semantics', () {
    test('entities with the same values are equal', () {
      final a = MovieDetailsModel.fromJson(json).toEntity();
      final b = MovieDetailsModel.fromJson(json).toEntity();

      expect(a, equals(b));
      expect(a.hashCode, b.hashCode);
    });

    test('changing a field breaks equality', () {
      final a = MovieDetailsModel.fromJson(json).toEntity();
      final b = a.copyWith(voteAverage: 5);

      expect(a, isNot(equals(b)));
    });

    test('model equals its entity', () {
      final model = MovieDetailsModel.fromJson(json);

      expect(model, equals(model.toEntity()));
    });

    test('copyWith only changes the given fields', () {
      final entity = MovieDetailsModel.fromJson(json).toEntity();
      final copy = entity.copyWith(title: 'Star Wars: Episodio IV', runtime: 90);

      expect(copy.title, 'Star Wars: Episodio IV');
      expect(copy.runtime, 90);
      expect(copy.id, entity.id);
      expect(copy.overview, entity.overview);
      expect(copy.genres.first, entity.genres.first);
      expect(copy, isNot(equals(entity)));
    });
  });
}
