import 'package:bloc/bloc.dart';
import 'package:music_app/modules/album/domain/entities/album_entity.dart';
import 'package:music_app/modules/artist/domain/usecases/get_all_artists_usecase.dart';

import '../../../album/domain/usecases/get_all_albums/get_all_albums_usecase.dart';
import '../../../artist/domain/entities/artist_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllArtistsUseCase getAllArtistsUseCase;
  final GetAllAlbumsUseCase getAllAlbumsUseCase;

  HomeCubit(
    this.getAllArtistsUseCase,
    this.getAllAlbumsUseCase,
  ) : super(HomeInitial());

  Future<List<ArtistEntity>> getAllArtists() async {
    final result = await getAllArtistsUseCase.call();
    return result.fold((error) => [], (success) => success);
  }

  Future<List<AlbumEntity>> getAllAlbums() async {
    final result = await getAllAlbumsUseCase.call();
    return result.fold((error) => [], (success) => success);
  }

  Future<void> loadAllData() async {
    if (isClosed) {
      return;
    }
    emit(HomeLoadingState());
    try {
      final artists = await getAllArtists();
      final albums = await getAllAlbums();
      emit(HomeLoadedState(artists, albums));
    } catch (e) {
      HomeErrorState(e.toString());
    }
  }
}
