import 'package:dartz/dartz.dart';
import 'package:music_app/modules/playlist/domain/entities/playlist_entity.dart';

import '../../../music/domain/entities/music_entity.dart';

abstract class PlaylistRepository {
  Future<Either<Exception, List<PlaylistEntity>>> getFeaturedPlaylists();
  Future<Either<Exception, List<MusicEntity>>> getPlaylistItems(
      String playlistId);
}
