import 'package:dartz/dartz.dart';
import 'package:music_app/modules/artist/domain/repositories/artists_repository.dart';

import '../../../music/domain/entities/music_entity.dart';

abstract class GetArtistTopTracksUseCase {
  Future<Either<Exception, List<MusicEntity>>> call(String artistId);
}

class GetArtistTopTracksUseCaseImp implements GetArtistTopTracksUseCase {
  final ArtistRepository _artistRepository;
  GetArtistTopTracksUseCaseImp(this._artistRepository);

  @override
  Future<Either<Exception, List<MusicEntity>>> call(String artistId) async {
    return _artistRepository.getArtistTopTracks(artistId);
  }
}
