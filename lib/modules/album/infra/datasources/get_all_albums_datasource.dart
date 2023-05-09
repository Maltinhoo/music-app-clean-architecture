import '../models/album_model.dart';

abstract class GetAllAlbumsDataSource {
  Future<List<AlbumModel>> call();
}
