import 'package:dartz/dartz.dart';

import '../entities/artist_entity.dart';
import '../repositories/get_all_artists_repository.dart';
import 'get_all_artists_usecase.dart';

class GetAllArtistsUseCaseImp implements GetAllArtistsUseCase {
  final GetAllArtistsRepository _getAllArtistsRepository;

  GetAllArtistsUseCaseImp(this._getAllArtistsRepository);

  @override
  Future<Either<Exception, List<ArtistEntity>>> call() async {
    return _getAllArtistsRepository();
  }
}
