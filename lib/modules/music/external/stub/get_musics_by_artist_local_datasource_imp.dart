import 'package:dartz/dartz.dart';

import '../../infra/datasources/get_musics_by_artists_datasource.dart';
import '../../infra/models/music_model.dart';

class GetMusicsByArtistLocalDataSourceImp
    implements GetMusicsByArtistDataSource {
  var musics = [
    {
      "id": "1",
      "title": "Musica 1",
      //  'artist': ArtistmModel(),
      //  'album': AlbumModel(),
      'duration': '4:12',
      'reproduction_count': 10,
      'is_explicit': true,
    }
  ];

  @override
  Future<Either<Exception, List<MusicModel>>> getMusicsByArtist(
      String artistId) async {
    try {
      var musicsList = musics.map((e) => MusicModel.fromJson(e)).toList();
      return Right(musicsList);
    } catch (e) {
      return Left(Exception('Error getting all artists'));
    }
  }
}
