import 'package:dartz/dartz.dart';
import 'package:music_app/layers/domain/entities/artist_entity.dart';

import '../../domain/repositories/get_all_artists_repository.dart';
import '../datasources/get_all_artists_datasource.dart';

class GetAllArtistsRepositoryImp implements GetAllArtistsRepository {
  final GetAllArtistsDataSource _dataSource;

  GetAllArtistsRepositoryImp(this._dataSource);

  @override
  Future<Either<Exception, List<ArtistEntity>>> getAllArtists() async {
    return _dataSource.getAllArtists();
  }
}
