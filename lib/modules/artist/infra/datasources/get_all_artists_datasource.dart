import 'package:dartz/dartz.dart';

import '../models/artist_model.dart';

abstract class GetAllArtistsDataSource {
  Future<Either<Exception, List<ArtistModel>>> call();
}
