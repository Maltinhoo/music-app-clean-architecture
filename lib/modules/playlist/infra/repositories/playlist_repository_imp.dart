import 'package:dartz/dartz.dart';
import 'package:music_app/modules/playlist/domain/entities/playlist_entity.dart';
import 'package:music_app/modules/playlist/domain/usecases/playlist_repository.dart';
import 'package:music_app/modules/playlist/infra/datasources/playlist_datasource.dart';

class PlaylistRepositoryImp implements PlaylistRepository {
  final PlaylistDataSource _playlistDataSource;

  PlaylistRepositoryImp(this._playlistDataSource);

  @override
  Future<Either<Exception, List<PlaylistEntity>>> getFeaturedPlaylists() {
    return _playlistDataSource.getFeaturedPlaylists();
  }
}
