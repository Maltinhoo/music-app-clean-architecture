import 'package:dartz/dartz.dart';

import '../entities/music_entity.dart';
import '../repositories/get_musics_by_artist_repository.dart';
import 'get_musics_by_artist_usecase.dart';

class GetMusicsByArtistUseCaseImp implements GetMusicsByArtistUseCase {
  final GetMusicsByArtistRepository _getMusicsByArtistRepository;

  GetMusicsByArtistUseCaseImp(this._getMusicsByArtistRepository);

  @override
  Future<Either<Exception, List<MusicEntity>>> call(String artist) async {
    return _getMusicsByArtistRepository(artist);
  }
}
