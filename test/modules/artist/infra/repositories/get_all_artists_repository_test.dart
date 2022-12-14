import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/core/inject/intect.dart';
import 'package:music_app/modules/artist/domain/entities/artist_entity.dart';
import 'package:music_app/modules/artist/infra/datasources/get_all_artists_datasource.dart';

void main() {
  Inject.init();
  GetAllArtistsDataSource dataSource = getIt();

  test('should return a list of artists', () async {
    var result = await dataSource();
    late List<ArtistEntity> artists;

    result.fold(
      (error) => print(error),
      (success) => artists = success,
    );
    expect(artists, isA<List<ArtistEntity>>());
  });
}
