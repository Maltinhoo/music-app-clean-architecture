import 'package:dartz/dartz.dart';
import 'package:music_app/modules/music/domain/entities/music_entity.dart';

import '../../domain/entities/artist_entity.dart';
import '../../domain/repositories/artists_repository.dart';
import '../datasources/get_all_artists_datasource.dart';
import '../datasources/get_artist_top_tracks.dart';

class ArtistsRepositoryImp implements ArtistRepository {
  final GetAllArtistsDataSource _getAllArtistsDataSource;
  final GetArtistTopTracksDataSource _getArtistTopTracksDataSource;

  ArtistsRepositoryImp(
      this._getAllArtistsDataSource, this._getArtistTopTracksDataSource);

  @override
  Future<Either<Exception, List<ArtistEntity>>> getAllArtists() async {
    try {
      final result = await _getAllArtistsDataSource();
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, List<MusicEntity>>> getArtistTopTracks(
      String artistId) async {
    try {
      final result = await _getArtistTopTracksDataSource(artistId);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
