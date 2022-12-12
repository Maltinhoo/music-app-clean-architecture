import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/layers/domain/entities/artist_entity.dart';

main() {
  test(
    'Albums should be empty',
    () {
      ArtistEntity entity = ArtistEntity(
        id: '1',
        name: 'Esfirra de Matuê',
        albums: [],
        backgroundImageUrl: '',
        bio: '',
        followers: 0,
        imageUrl: '',
        monthlyListeners: 0,
        songs: [],
        tags: '',
      );
      expect(entity.albums, isEmpty);
    },
  );
}
