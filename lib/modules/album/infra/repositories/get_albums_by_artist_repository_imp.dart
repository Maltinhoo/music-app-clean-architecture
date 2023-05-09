import 'package:dartz/dartz.dart';

import '../../domain/entities/album_entity.dart';
import '../../domain/repositories/get_albums_by_artist_repository.dart';
import '../datasources/get_albums_by_artist_datasource.dart';

class GetAlbumsByArtistRepositoryImp implements GetAlbumsByArtistRepository {
  final GetAlbumsByArtistDataSource _getAlbumsByArtistDataSource;

  GetAlbumsByArtistRepositoryImp(this._getAlbumsByArtistDataSource);

  @override
  Future<Either<Exception, List<AlbumEntity>>> call(String artistId) async {
    try {
      final result = await _getAlbumsByArtistDataSource(artistId);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
