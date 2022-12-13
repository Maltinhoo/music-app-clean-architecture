import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../infra/datasources/get_musics_by_artists_datasource.dart';
import '../../../infra/models/music_model.dart';

class GetMusicsByArtistHttpDataSourceImp
    implements GetMusicsByArtistDataSource {
  @override
  Future<Either<Exception, List<MusicModel>>> getMusicsByArtist(
      String artistId) async {
    try {
      var link = Uri.parse('http://localhost:3000/artists/$artistId/musics');
      var response = await http.get(link, headers: {'artistId': artistId});
      var result =
          (response.body as List).map((e) => MusicModel.fromJson(e)).toList();
      return Right(result);
    } catch (e) {
      return Left(Exception('Error getting all artists'));
    }
  }
}
