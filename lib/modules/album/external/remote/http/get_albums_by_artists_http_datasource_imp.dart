import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../infra/datasources/get_albums_by_artist_datasource.dart';
import '../../../infra/models/album_model.dart';

class GetAlbumsByArtistHttpDataSourceImp
    implements GetAlbumsByArtistDataSource {
  @override
  Future<List<AlbumModel>> call(String artistId) async {
    final response = await http.get(
      Uri.parse(
          'https://itunes.apple.com/lookup?id=$artistId&entity=album&limit=5'),
    );
    if (response.statusCode == 200) {
      var result = (json.decode(response.body)['results'] as List)
          .map((e) => AlbumModel.fromJson(e))
          .toList();
      return result;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
