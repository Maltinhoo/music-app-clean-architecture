import 'package:dartz/dartz.dart';

import '../../entities/album_entity.dart';
import '../../repositories/get_albums_by_artist_repository.dart';
import 'get_albums_by_artist_usecase.dart';

class GetAlbumsByArtistUseCaseImp implements GetAlbumsByArtistUseCase {
  final GetAlbumsByArtistRepository _getAlbumsByArtistRepository;

  GetAlbumsByArtistUseCaseImp(this._getAlbumsByArtistRepository);

  @override
  Future<Either<Exception, List<AlbumEntity>>> call(String artistId) {
    return _getAlbumsByArtistRepository(artistId);
  }
}
