import 'package:dartz/dartz.dart';
import 'package:music_app/modules/playlist/infra/models/playlist_model.dart';

abstract class PlaylistDataSource {
  Future<Either<Exception, List<PlaylistModel>>> getFeaturedPlaylists();
}
