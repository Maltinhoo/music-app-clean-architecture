import 'package:dartz/dartz.dart';
import 'package:music_app/layers/domain/entities/music_entity.dart';
import 'package:music_app/layers/domain/repositories/get_musics_by_artist_repository.dart';

import 'get_musics_by_artist_usecase.dart';

class GetMusicsByArtistUseCaseImp implements GetMusicsByArtistUseCase {
  final GetMusicsByArtistRepository _repository;

  GetMusicsByArtistUseCaseImp(this._repository);

  @override
  Future<Either<Exception, List<MusicEntity>>> getMusicsByArtist(
      String artist) async {
    return _repository.getMusicsByArtist(artist);
  }
}
