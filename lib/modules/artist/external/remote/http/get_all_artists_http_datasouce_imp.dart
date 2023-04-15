import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../authorization/external/spotify_api.dart';
import '../../../../authorization/infra/models/authorization_model.dart';
import '../../../infra/datasources/get_all_artists_datasource.dart';
import '../../../infra/models/artist_model.dart';

class GetAllArtistsHttpDataSourceImp implements GetAllArtistsDataSource {
  @override
  Future<Either<Exception, List<ArtistModel>>> call() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? '';
    String tokenType = prefs.getString('token_type') ?? '';
    String authorizationWithToken = '$tokenType $accessToken';
    var link = Uri.parse(
        'https://api.spotify.com/v1/artists?ids=53XhwfbYqKCa1cC15pYq2q,7jVv8c5Fj3E9VhNjxT4snq,5nP8x4uEFjAAmDzwOEc9b8,68YeXpLt3jB7JHQS5ZjMGo,3MrDVzg7ZXaYMyQmbDInr7');
    try {
      var response = await http.get(link, headers: {
        'Authorization': authorizationWithToken,
      });

      if (response.statusCode == 401) {
        String refreshToken = prefs.getString('refresh_token') ?? '';
        String authorizationStr = "$clientId:$clientSecret";
        var bytes = utf8.encode(authorizationStr);
        var base64Str = base64.encode(bytes);
        String authorization = 'Basic $base64Str';
        var responseNewToken = await http.post(
          Uri.parse("https://accounts.spotify.com/api/token"),
          body: {
            'grant_type': 'refresh_token',
            'refresh_token': refreshToken,
            'redirect_uri': 'alarmfy:/',
          },
          headers: {'Authorization': authorization},
        );

        if (responseNewToken.statusCode == 200) {
          // If the call to the server was successful, parse the JSON
          AuthorizationModel aM =
              AuthorizationModel.fromJson(json.decode(responseNewToken.body));
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('access_token', aM.accessToken);
          prefs.setString('token_type', aM.tokenType);
          prefs.setBool('logged', true);

          accessToken = prefs.getString('access_token') ?? '';
          tokenType = prefs.getString('token_type') ?? '';
          String authorizationWithToken = '$tokenType $accessToken';
          response = await http
              .get(link, headers: {'Authorization': authorizationWithToken});
          print("Novo Token");
        } else {
          // If that call was not successful, throw an error.
          throw Exception('Failed to request a new token');
        }
      }

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
