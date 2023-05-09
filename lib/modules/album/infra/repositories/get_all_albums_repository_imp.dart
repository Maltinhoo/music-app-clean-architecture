import 'package:dartz/dartz.dart';
import 'package:music_app/modules/album/domain/entities/album_entity.dart';

import '../../domain/repositories/get_all_albums_repository.dart';
import '../datasources/get_all_albums_datasource.dart';

class GetAllAlbumsRepositoryImp implements GetAllAlbumsRepository {
  final GetAllAlbumsDataSource _getAllAlbumsDataSource;

  GetAllAlbumsRepositoryImp(this._getAllAlbumsDataSource);

  @override
  Future<Either<Exception, List<AlbumEntity>>> call() async {
    try {
      final result = await _getAllAlbumsDataSource();
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
