import 'package:dartz/dartz.dart';

import '../entities/album_entity.dart';

abstract class GetAlbumsByArtistRepository {
  Future<Either<Exception, List<AlbumEntity>>> call(String artistId);
}
