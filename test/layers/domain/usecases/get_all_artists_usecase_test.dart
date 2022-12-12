import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/core/inject/intect.dart';
import 'package:music_app/layers/domain/entities/artist_entity.dart';
import 'package:music_app/layers/domain/usecases/get_all_artists/get_all_artists_usecase.dart';

main() {
  Inject.init();
  test('should return a list of artists', () async {
    GetAllArtistsUseCase dataSource = getIt();
    var result = await dataSource.getAllArtists();
    late List<ArtistEntity> artists;

    result.fold(
      (error) => print(error),
      (success) => artists = success,
    );
    expect(artists, isA<List<ArtistEntity>>());
  });
}
