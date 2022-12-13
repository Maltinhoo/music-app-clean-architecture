import 'package:dartz/dartz.dart';

import '../entities/music_entity.dart';

abstract class GetMusicsByArtistUseCase {
  Future<Either<Exception, List<MusicEntity>>> call(String artistId);
}
