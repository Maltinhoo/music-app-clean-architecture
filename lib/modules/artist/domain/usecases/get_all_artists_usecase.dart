import 'package:dartz/dartz.dart';

import '../entities/artist_entity.dart';
import '../repositories/artists_repository.dart';

abstract class GetAllArtistsUseCase {
  Future<Either<Exception, List<ArtistEntity>>> call();
}

class GetAllArtistsUseCaseImp implements GetAllArtistsUseCase {
  final ArtistRepository _artistsRepository;

  GetAllArtistsUseCaseImp(this._artistsRepository);

  @override
  Future<Either<Exception, List<ArtistEntity>>> call() async {
    return _artistsRepository.getAllArtists();
  }
}
