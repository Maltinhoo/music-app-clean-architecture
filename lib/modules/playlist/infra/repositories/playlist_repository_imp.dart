import 'package:dartz/dartz.dart';
import 'package:music_app/modules/music/domain/entities/music_entity.dart';
import 'package:music_app/modules/playlist/domain/entities/playlist_entity.dart';
import 'package:music_app/modules/playlist/domain/repositories/playlist_repository.dart';
import 'package:music_app/modules/playlist/infra/datasources/playlist_datasource.dart';

class PlaylistRepositoryImp implements PlaylistRepository {
  final PlaylistDataSource _playlistDataSource;

  PlaylistRepositoryImp(this._playlistDataSource);

  @override
  Future<Either<Exception, List<PlaylistEntity>>> getFeaturedPlaylists() {
    return _playlistDataSource.getFeaturedPlaylists();
  }

  @override
  Future<Either<Exception, List<MusicEntity>>> getPlaylistItems(
      String playlistId) async {
    try {
      final result = await _playlistDataSource.getPlaylistItems(playlistId);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
