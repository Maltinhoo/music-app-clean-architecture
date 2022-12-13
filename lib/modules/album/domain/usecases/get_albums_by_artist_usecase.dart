import 'package:dartz/dartz.dart';

import '../entities/album_entity.dart';

abstract class GetAlbumsByArtistUseCase {
  Future<Either<Exception, List<AlbumEntity>>> getAlbumsByArtist(
      String artistId);
}
