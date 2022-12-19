import 'package:dartz/dartz.dart';

import '../models/album_model.dart';

abstract class GetAllAlbumsDataSource {
  Future<Either<Exception, List<AlbumModel>>> call();
}
