import 'package:dartz/dartz.dart';

import '../entities/album_entity.dart';

abstract class GetAllAlbumsRepository {
  Future<Either<Exception, List<AlbumEntity>>> call();
}
