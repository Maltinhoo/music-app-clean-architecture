import 'package:dartz/dartz.dart';

import '../models/music_model.dart';

abstract class GetMusicsByArtistDataSource {
  Future<Either<Exception, List<MusicModel>>> call(String artistId);
}
