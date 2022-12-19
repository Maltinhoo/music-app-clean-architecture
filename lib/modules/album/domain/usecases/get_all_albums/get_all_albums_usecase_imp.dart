import 'package:dartz/dartz.dart';
import 'package:music_app/modules/album/domain/entities/album_entity.dart';
import 'package:music_app/modules/album/domain/repositories/get_all_albums_repository.dart';

import 'get_all_albums_usecase.dart';

class GetAllAlbumsUseCaseImp implements GetAllAlbumsUseCase {
  final GetAllAlbumsRepository getAllAlbumsRepository;

  GetAllAlbumsUseCaseImp(this.getAllAlbumsRepository);

  @override
  Future<Either<Exception, List<AlbumEntity>>> call() async {
    return await getAllAlbumsRepository();
  }
}
