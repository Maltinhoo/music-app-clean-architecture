import 'package:dartz/dartz.dart';
import 'package:music_app/modules/playlist/domain/repositories/playlist_repository.dart';

import '../entities/playlist_entity.dart';

abstract class GetFeaturedPlaylistsUsecase {
  Future<Either<Exception, List<PlaylistEntity>>> call();
}

class GetFeaturedPlaylistsUsecaseImp implements GetFeaturedPlaylistsUsecase {
  final PlaylistRepository _playlistRepository;

  GetFeaturedPlaylistsUsecaseImp(this._playlistRepository);

  @override
  Future<Either<Exception, List<PlaylistEntity>>> call() {
    return _playlistRepository.getFeaturedPlaylists();
  }
}
