import 'package:dartz/dartz.dart';
import 'package:music_app/layers/domain/entities/music_entity.dart';

import '../../domain/repositories/get_musics_by_artist_repository.dart';
import '../datasources/get_musics_by_artists_datasource.dart';

class GetMusicsByArtistRepositoryImp implements GetMusicsByArtistRepository {
  final GetMusicsByArtistDataSource _dataSource;

  GetMusicsByArtistRepositoryImp(this._dataSource);

  @override
  Future<Either<Exception, List<MusicEntity>>> getMusicsByArtist(
      String artistId) async {
    return _dataSource.getMusicsByArtist(artistId);
  }
}
