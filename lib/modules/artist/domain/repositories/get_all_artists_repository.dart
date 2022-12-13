import 'package:dartz/dartz.dart';

import '../entities/artist_entity.dart';

abstract class GetAllArtistsRepository {
  Future<Either<Exception, List<ArtistEntity>>> call();
}
