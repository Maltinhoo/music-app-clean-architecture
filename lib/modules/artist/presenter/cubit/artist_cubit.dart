import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_app/modules/music/domain/entities/music_entity.dart';
import 'package:music_app/modules/music/domain/usecases/get_musics_by_artist_usecase.dart';

part 'artist_state.dart';

class ArtistCubit extends Cubit<ArtistState> {
  final GetMusicsByArtistUseCase getMusicsByArtistUseCase;
  ArtistCubit(this.getMusicsByArtistUseCase) : super(ArtistInitial());

  Future<void> initializeArtist(String artist) async {
    emit(ArtistLoadingState());
    try {
      final musics = await getMusicsByArtist(artist);
      emit(ArtistLoadedState(musics));
    } catch (e) {
      emit(ArtistErrorState(e.toString()));
    }
  }

  Future<List<MusicEntity>> getMusicsByArtist(String artist) async {
    final result = await getMusicsByArtistUseCase(artist);
    return result.fold((error) => [], (success) => success);
  }
}
