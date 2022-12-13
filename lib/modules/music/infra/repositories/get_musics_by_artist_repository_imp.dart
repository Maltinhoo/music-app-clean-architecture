import 'package:dartz/dartz.dart';

import '../../domain/entities/music_entity.dart';
import '../../domain/repositories/get_musics_by_artist_repository.dart';
import '../datasources/get_musics_by_artists_datasource.dart';

class GetMusicsByArtistRepositoryImp implements GetMusicsByArtistRepository {
  final GetMusicsByArtistDataSource _getMusicsByArtistDataSource;

  GetMusicsByArtistRepositoryImp(this._getMusicsByArtistDataSource);

  @override
  Future<Either<Exception, List<MusicEntity>>> call(String artistId) async {
    return _getMusicsByArtistDataSource(artistId);
  }
}
