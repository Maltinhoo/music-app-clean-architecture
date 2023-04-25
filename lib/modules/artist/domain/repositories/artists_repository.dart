import 'package:dartz/dartz.dart';
import 'package:music_app/modules/music/domain/entities/music_entity.dart';

import '../entities/artist_entity.dart';

abstract class ArtistRepository {
  Future<Either<Exception, List<ArtistEntity>>> getAllArtists();
  Future<Either<Exception, List<MusicEntity>>> getArtistTopTracks(
      String artistId);
}
