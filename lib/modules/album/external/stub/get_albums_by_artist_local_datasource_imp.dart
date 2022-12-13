import 'package:dartz/dartz.dart';

import '../../infra/datasources/get_albums_by_artist_datasource.dart';
import '../../infra/models/album_model.dart';

class GetAlbumsByArtistLocalDataSourceImp
    implements GetAlbumsByArtistDataSource {
  var albums = [
    {
      "id": "1",
      "title": "Album 1",
      'albumArtUrl': 'test',
      //  'artist': ArtistModel(),
      'song_count': 5,
      'duration': '4:12',
      'release_date': DateTime.november,
      // 'songs': MusicModel(),
    }
  ];

  @override
  Future<Either<Exception, List<AlbumModel>>> call(String artistId) async {
    try {
      var albumsList = albums.map((e) => AlbumModel.fromJson(e)).toList();
      return Right(albumsList);
    } catch (e) {
      return Left(Exception('Error getting all artists'));
    }
  }
}
