import 'package:dartz/dartz.dart';
import 'package:music_app/layers/domain/entities/artist_entity.dart';
import 'package:music_app/layers/domain/repositories/get_all_artists_repository.dart';

import 'get_all_artists_usecase.dart';

class GetAllArtistsUseCaseImp implements GetAllArtistsUseCase {
  final GetAllArtistsRepository _repository;

  GetAllArtistsUseCaseImp(this._repository);

  @override
  Future<Either<Exception, List<ArtistEntity>>> getAllArtists() async {
    return _repository.getAllArtists();
  }
}
