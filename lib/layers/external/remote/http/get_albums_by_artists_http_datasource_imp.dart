import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/layers/infra/models/album_model.dart';

import '../../../infra/datasources/get_albums_by_artist_datasource.dart';

class GetAlbumsByArtistHttpDataSourceImp
    implements GetAlbumsByArtistDataSource {
  @override
  Future<Either<Exception, List<AlbumModel>>> getAlbumsByArtist(
      String artistId) async {
    try {
      var link = Uri.parse('http://localhost:3000/artists/$artistId/albums');
      var response = await http.get(link, headers: {'artistId': artistId});
      var result =
          (response.body as List).map((e) => AlbumModel.fromJson(e)).toList();
      return Right(result);
    } catch (e) {
      return Left(Exception('Error getting all artists'));
    }
  }
}
