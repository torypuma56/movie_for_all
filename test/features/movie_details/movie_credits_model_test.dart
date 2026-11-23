import 'package:flutter_test/flutter_test.dart';
import 'package:movies_4_all/features/movie_details/data/models/movie_credits_model.dart';

void main() {
  const json = {
    'id': 550,
    'cast': [
      {
        'adult': false,
        'gender': 2,
        'id': 819,
        'known_for_department': 'Acting',
        'name': 'Edward Norton',
        'original_name': 'Edward Norton',
        'popularity': 26.99,
        'profile_path': '/8nytsqL59SFJTVYVrN72k6qkGgJ.jpg',
        'cast_id': 4,
        'character': 'The Narrator',
        'credit_id': '52fe4250c3a36847f80149f3',
        'order': 1,
      },
      {
        'adult': false,
        'gender': 2,
        'id': 287,
        'known_for_department': 'Acting',
        'name': 'Brad Pitt',
        'original_name': 'Brad Pitt',
        'popularity': 45.202,
        'profile_path': '/huV2cdcolEUwJy37QvH914vup7d.jpg',
        'cast_id': 5,
        'character': 'Tyler Durden',
        'credit_id': '52fe4250c3a36847f80149f7',
        'order': 0,
      },
      {
        'adult': false,
        'gender': 2,
        'id': 999,
        'known_for_department': 'Directing',
        'name': 'Director',
        'original_name': 'Director',
        'popularity': 1.0,
        'profile_path': '/director.jpg',
        'cast_id': 99,
        'character': 'Director',
        'credit_id': 'director-credit',
        'order': 2,
      },
      {
        'adult': false,
        'gender': 2,
        'id': 7470,
        'known_for_department': 'Acting',
        'name': 'Meat Loaf',
        'original_name': 'Meat Loaf',
        'popularity': 7.738,
        'profile_path': null,
        'cast_id': 7,
        'character': 'Robert "Bob" Paulson',
        'credit_id': '52fe4250c3a36847f80149ff',
        'order': 3,
      },
      {
        'adult': true,
        'gender': 1,
        'id': 111,
        'known_for_department': 'Acting',
        'name': 'Adult Actor',
        'original_name': 'Adult Actor',
        'popularity': 1.0,
        'profile_path': '/adult.jpg',
        'cast_id': 111,
        'character': 'Guest',
        'credit_id': 'adult-credit',
        'order': 4,
      },
    ],
  };

  group('MovieCreditsModel', () {
    test('parses the credits response', () {
      final credits = MovieCreditsModel.fromJson(json).toEntity();

      expect(credits.id, 550);
      expect(credits.cast, hasLength(5));
      expect(credits.cast.first.name, 'Edward Norton');
      expect(credits.cast.first.character, 'The Narrator');
      expect(
        credits.cast.first.profilePath,
        '/8nytsqL59SFJTVYVrN72k6qkGgJ.jpg',
      );
    });

    test('filters acting cast with photo and sorts by order', () {
      final credits = MovieCreditsModel.fromJson(json).toEntity();

      expect(
        credits.filteredActingCast.map((cast) => cast.name),
        ['Brad Pitt', 'Edward Norton'],
      );
    });
  });
}
