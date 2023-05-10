import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_app/modules/playlist/domain/usecases/get_playlist_items_usecase.dart';

import '../../../music/domain/entities/music_entity.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  final GetPlaylistItemsUseCase getPlaylistItemsUseCase;
  PlaylistCubit(this.getPlaylistItemsUseCase) : super(PlaylistInitial());

  Future<void> initializePlaylist(String playlistId) async {
    emit(PlaylistLoading());
    try {
      final result = await getPlaylistItems(playlistId);

      emit(PlaylistLoaded(result));
    } catch (e) {
      emit(PlaylistError(e.toString()));
    }
  }

  Future<List<MusicEntity>> getPlaylistItems(String playlistId) async {
    final result = await getPlaylistItemsUseCase(playlistId);
    return result.fold((l) => throw Exception(l), (r) => r);
  }
}
