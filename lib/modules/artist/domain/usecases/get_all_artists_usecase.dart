import 'package:dartz/dartz.dart';

import '../entities/artist_entity.dart';

abstract class GetAllArtistsUseCase {
  Future<Either<Exception, List<ArtistEntity>>> getAllArtists();
}
