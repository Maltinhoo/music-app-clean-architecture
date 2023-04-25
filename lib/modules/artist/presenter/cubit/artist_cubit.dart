import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_app/modules/artist/domain/usecases/get_artist_top_tracks_use_case.dart';
import 'package:music_app/modules/music/domain/entities/music_entity.dart';
import 'package:music_app/modules/music/domain/usecases/get_musics_by_artist_usecase.dart';

part 'artist_state.dart';

class ArtistCubit extends Cubit<ArtistState> {
  final GetMusicsByArtistUseCase getMusicsByArtistUseCase;
  final GetArtistTopTracksUseCase getArtistTopTracksUseCase;
  ArtistCubit(this.getMusicsByArtistUseCase, this.getArtistTopTracksUseCase)
      : super(ArtistInitial());

  Future<void> initializeArtist(String artistId) async {
    emit(ArtistLoadingState());
    try {
      final topTracks = await getArtistTopTracks(artistId);
      emit(ArtistLoadedState(topTracks));
    } catch (e) {
      emit(ArtistErrorState(e.toString()));
    }
  }

  Future<List<MusicEntity>> getMusicsByArtist(String artist) async {
    final result = await getMusicsByArtistUseCase(artist);
    return result.fold((error) => [], (success) => success);
  }

  Future<List<MusicEntity>> getArtistTopTracks(String artistId) async {
    final result = await getArtistTopTracksUseCase(artistId);
    return result.fold((error) => [], (success) => success);
  }
}
