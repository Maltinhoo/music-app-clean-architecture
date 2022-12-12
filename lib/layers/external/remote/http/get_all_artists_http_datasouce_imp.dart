import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/layers/infra/datasources/get_all_artists_datasource.dart';
import 'package:music_app/layers/infra/models/artist_model.dart';

class GetAllArtistsHttpDataSourceImp implements GetAllArtistsDataSource {
  @override
  Future<Either<Exception, List<ArtistModel>>> getAllArtists() async {
    try {
      var link = Uri.parse('http://localhost:3000/artists');
      var response = await http.get(link);
      var result =
          (response.body as List).map((e) => ArtistModel.fromJson(e)).toList();
      return Right(result);
    } catch (e) {
      return Left(Exception('Error getting all artists'));
    }
  }
}
