import 'package:dartz/dartz.dart';

import '../../entities/album_entity.dart';

abstract class GetAllAlbumsUseCase {
  Future<Either<Exception, List<AlbumEntity>>> call();
}
