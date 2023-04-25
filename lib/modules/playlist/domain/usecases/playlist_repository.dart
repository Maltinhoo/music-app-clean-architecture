import 'package:dartz/dartz.dart';
import 'package:music_app/modules/playlist/domain/entities/playlist_entity.dart';

abstract class PlaylistRepository {
  Future<Either<Exception, List<PlaylistEntity>>> getFeaturedPlaylists();
}
