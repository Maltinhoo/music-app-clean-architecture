import '../../../album/domain/entities/album_entity.dart';
import '../../../music/domain/entities/music_entity.dart';
import '../../infra/datasources/get_all_artists_datasource.dart';
import '../../infra/models/artist_model.dart';

class GetAllArtistsLocalDataSourceImp implements GetAllArtistsDataSource {
  var artists = [
    {
      "id": "1",
      "name": "The Beatles",
      "imageUrl": "test",
      'backgroundImageUrl': 'test',
      'monthlyListeners': 1234567,
      "followers": 123456,
      'bio': 'test',
      'tags': 'test',
      "songs": <MusicEntity>[],
      "albums": <AlbumEntity>[],
    }
  ];

  @override
  Future<List<ArtistModel>> call() async {
    return artists.map((artist) => ArtistModel.fromJson(artist)).toList();
  }
}
