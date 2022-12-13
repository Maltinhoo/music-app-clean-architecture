import 'package:dartz/dartz.dart';

import '../models/album_model.dart';

abstract class GetAlbumsByArtistDataSource {
  Future<Either<Exception, List<AlbumModel>>> call(String artistId);
}
