import '../models/album_model.dart';

abstract class GetAlbumsByArtistDataSource {
  Future<List<AlbumModel>> call(String artistId);
}
