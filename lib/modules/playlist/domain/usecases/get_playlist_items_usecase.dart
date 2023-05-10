import 'package:dartz/dartz.dart';
import 'package:music_app/modules/music/domain/entities/music_entity.dart';

import '../repositories/playlist_repository.dart';

abstract class GetPlaylistItemsUseCase {
  Future<Either<Exception, List<MusicEntity>>> call(String playlistId);
}

class GetPlaylistItemsUseCaseImp implements GetPlaylistItemsUseCase {
  final PlaylistRepository repository;

  GetPlaylistItemsUseCaseImp(this.repository);

  @override
  Future<Either<Exception, List<MusicEntity>>> call(String playlistId) async {
    return await repository.getPlaylistItems(playlistId);
  }
}
