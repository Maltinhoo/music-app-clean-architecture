import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/modules/artist/infra/datasources/get_artist_top_tracks.dart';
import 'package:music_app/modules/music/infra/models/music_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../authorization/domain/usecases/refresh_token/refresh_token.dart';

class GetArtistTopTracksHttpDataSourceImp
    implements GetArtistTopTracksDataSource {
  final RefreshTokenUseCase _refreshToken;

  GetArtistTopTracksHttpDataSourceImp(this._refreshToken);

  @override
  Future<Either<Exception, List<MusicModel>>> call(String artistId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? '';
    String tokenType = prefs.getString('token_type') ?? '';
    String authorizationWithToken = '$tokenType $accessToken';
    var link = Uri.parse(
        'https://api.spotify.com/v1/artists/$artistId/top-tracks?market=BR');
    try {
      var response = await http.get(link, headers: {
        'Authorization': authorizationWithToken,
      });
      // if (response.statusCode == 401) {
      //   response = await _refreshToken(link, accessToken, tokenType,
      //       prefs.getString('refresh_token') ?? '');
      // }

      if (response.statusCode == 200) {
        var result = (json.decode(response.body)['tracks'] as List)
            .map((e) => MusicModel.fromJson(e))
            .toList();
        return Right(result);
      } else {
        // If that call was not successful, throw an error.
        print("StatusCode: ${response.statusCode}");
        print("BODY: ${response.body}");
        throw Exception('Failed to get Artists');
      }
    } catch (e) {
      return Left(Exception('Error getting all artists'));
    }
  }
}
