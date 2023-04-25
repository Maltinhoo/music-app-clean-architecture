import 'package:dartz/dartz.dart';

import '../../../music/infra/models/music_model.dart';

abstract class GetArtistTopTracksDataSource {
  Future<Either<Exception, List<MusicModel>>> call(String artistId);
}
