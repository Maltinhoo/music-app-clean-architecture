import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/modules/playlist/infra/datasources/playlist_datasource.dart';
import 'package:music_app/modules/playlist/infra/models/playlist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../authorization/external/spotify_api.dart';
import '../../../../authorization/infra/models/authorization_model.dart';
import '../../../../music/infra/models/music_model.dart';

class GetFeaturedPlaylistsHttpDataSourceImp implements PlaylistDataSource {
  @override
  Future<Either<Exception, List<PlaylistModel>>> getFeaturedPlaylists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? '';
    String tokenType = prefs.getString('token_type') ?? '';
    String authorizationWithToken = '$tokenType $accessToken';
    var link = Uri.parse(
        'https://api.spotify.com/v1/users/$userId/playlists?offset=0&limit=10');
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
        var result = (json.decode(response.body)['items'] as List)
            .map((e) => PlaylistModel.fromJson(e))
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

  @override
  Future<List<MusicModel>> getPlaylistItems(String playlistId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('access_token') ?? '';
    String tokenType = prefs.getString('token_type') ?? '';
    String authorizationWithToken = '$tokenType $accessToken';
    var link =
        Uri.parse('https://api.spotify.com/v1/playlists/$playlistId/tracks');
    try {
      var response = await http.get(link, headers: {
        'Authorization': authorizationWithToken,
      });

      if (response.statusCode == 200) {
        var result = (json.decode(response.body)['items'] as List)
            .map((e) => MusicModel.fromJson(e['track']))
            .toList();
        return result;
      } else {
        throw Exception('Failed to get Artists');
      }
    } catch (e) {
      throw Exception('Failed to get Artists');
    }
  }
}
