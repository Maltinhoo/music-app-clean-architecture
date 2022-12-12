import 'package:dartz/dartz.dart';
import 'package:music_app/layers/domain/entities/artist_entity.dart';

abstract class GetAllArtistsUseCase {
  Future<Either<Exception, List<ArtistEntity>>> getAllArtists();
}
