import 'package:dartz/dartz.dart';

import '../../domain/entities/artist_entity.dart';
import '../../domain/repositories/get_all_artists_repository.dart';
import '../datasources/get_all_artists_datasource.dart';

class GetAllArtistsRepositoryImp implements GetAllArtistsRepository {
  final GetAllArtistsDataSource _getAllArtistsDataSource;

  GetAllArtistsRepositoryImp(this._getAllArtistsDataSource);

  @override
  Future<Either<Exception, List<ArtistEntity>>> call() async {
    return _getAllArtistsDataSource();
  }
}
