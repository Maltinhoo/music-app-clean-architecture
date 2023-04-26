import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/modules/authorization/domain/usecases/refresh_token/refresh_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../infra/datasources/get_all_artists_datasource.dart';
import '../../../infra/models/artist_model.dart';

class GetAllArtistsHttpDataSourceImp implements GetAllArtistsDataSource {
  final RefreshTokenUseCase _refreshToken;

  GetAllArtistsHttpDataSourceImp(this._refreshToken);

  @override
  Future<Either<Exception, List<ArtistModel>>> call() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? '';
    String tokenType = prefs.getString('token_type') ?? '';
    String authorizationWithToken = '$tokenType $accessToken';
    var link = Uri.parse(
        'https://api.spotify.com/v1/artists?ids=1WXbiUMl1AT9Inb619xPUg,0JjPiLQNgAFaEkwoy56B1C,7jVv8c5Fj3E9VhNjxT4snq,5nP8x4uEFjAAmDzwOEc9b8,68YeXpLt3jB7JHQS5ZjMGo,3MrDVzg7ZXaYMyQmbDInr7,53XhwfbYqKCa1cC15pYq2q');
    try {
      var response = await http.get(
        link,
        headers: {'Authorization': authorizationWithToken},
      );

      // if (response.statusCode == 401) {
      //   response = await _refreshToken(link, accessToken, tokenType,
      //       prefs.getString('refresh_token') ?? '');
      // }

      if (response.statusCode == 200) {
        var result = (json.decode(response.body)['artists'] as List)
            .map((e) => ArtistModel.fromJson(e))
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
