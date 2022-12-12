import 'package:dartz/dartz.dart';
import 'package:music_app/layers/domain/entities/album_entity.dart';
import 'package:music_app/layers/infra/datasources/get_albums_by_artist_datasource.dart';

import '../../domain/repositories/get_albums_by_artist_repository.dart';

class GetAlbumsByArtistRepositoryImp implements GetAlbumsByArtistRepository {
  final GetAlbumsByArtistDataSource _dataSource;

  GetAlbumsByArtistRepositoryImp(this._dataSource);

  @override
  Future<Either<Exception, List<AlbumEntity>>> getAlbumsByArtist(
      String artistId) async {
    return _dataSource.getAlbumsByArtist(artistId);
  }
}
