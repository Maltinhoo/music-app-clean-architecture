import 'package:dartz/dartz.dart';
import 'package:music_app/layers/domain/repositories/get_albums_by_artist_repository.dart';

import '../../entities/album_entity.dart';
import 'get_albums_by_artist_usecase.dart';

class GetAlbumsByArtistUseCaseImp implements GetAlbumsByArtistUseCase {
  final GetAlbumsByArtistRepository _repository;

  GetAlbumsByArtistUseCaseImp(this._repository);

  @override
  Future<Either<Exception, List<AlbumEntity>>> getAlbumsByArtist(
      String artistId) {
    return _repository.getAlbumsByArtist(artistId);
  }
}
