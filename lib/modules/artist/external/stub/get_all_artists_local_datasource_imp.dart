import 'package:dartz/dartz.dart';

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
  Future<Either<Exception, List<ArtistModel>>> call() async {
    try {
      var result = artists.map((e) => ArtistModel.fromJson(e)).toList();
      return Right(result);
    } catch (e) {
      return Left(Exception('Error while getting artists'));
    }
  }
}
