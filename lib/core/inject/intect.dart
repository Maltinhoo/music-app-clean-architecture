import 'package:get_it/get_it.dart';
import 'package:music_app/modules/album/domain/repositories/get_all_albums_repository.dart';
import 'package:music_app/modules/album/domain/usecases/get_all_albums/get_all_albums_usecase.dart';
import 'package:music_app/modules/album/external/remote/firebase/get_all_albums_firebase_datasource_imp.dart';
import 'package:music_app/modules/album/infra/datasources/get_all_albums_datasource.dart';
import 'package:music_app/modules/artist/domain/usecases/get_artist_top_tracks_usecase.dart';
import 'package:music_app/modules/artist/presenter/cubit/artist_cubit.dart';
import 'package:music_app/modules/authorization/domain/usecases/fetch_token/fetch_token_usecase.dart';
import 'package:music_app/modules/authorization/domain/usecases/refresh_token/refresh_token.dart';
import 'package:music_app/modules/authorization/presenter/cubit/authorization_cubit.dart';
import 'package:music_app/modules/playlist/domain/usecases/get_featured_playlists_usecase.dart';

import '../../modules/album/domain/repositories/get_albums_by_artist_repository.dart';
import '../../modules/album/domain/usecases/get_albums_by_artist/get_albums_by_artist_usecase.dart';
import '../../modules/album/domain/usecases/get_albums_by_artist/get_albums_by_artist_usecase_imp.dart';
import '../../modules/album/domain/usecases/get_all_albums/get_all_albums_usecase_imp.dart';
import '../../modules/album/external/stub/get_albums_by_artist_local_datasource_imp.dart';
import '../../modules/album/infra/datasources/get_albums_by_artist_datasource.dart';
import '../../modules/album/infra/repositories/get_albums_by_artist_repository_imp.dart';
import '../../modules/album/infra/repositories/get_all_albums_repository_imp.dart';
import '../../modules/artist/domain/repositories/artists_repository.dart';
import '../../modules/artist/domain/usecases/get_all_artists_usecase.dart';
import '../../modules/artist/external/remote/http/get_all_artists_http_datasouce_imp.dart';
import '../../modules/artist/external/remote/http/get_artist_top_tracks_http_datasource_imp.dart';
import '../../modules/artist/infra/datasources/get_all_artists_datasource.dart';
import '../../modules/artist/infra/datasources/get_artist_top_tracks.dart';
import '../../modules/artist/infra/repositories/artists_repository_imp.dart';
import '../../modules/authorization/domain/repositories/authorization_repository.dart';
import '../../modules/authorization/domain/usecases/fetch_code/fetch_code_usecase.dart';
import '../../modules/authorization/domain/usecases/fetch_code/fetch_code_usecase_imp.dart';
import '../../modules/authorization/domain/usecases/fetch_token/fetch_token_usecase_imp.dart';
import '../../modules/authorization/domain/usecases/refresh_token/refresh_token_imp.dart';
import '../../modules/authorization/external/spotify_api.dart';
import '../../modules/authorization/infra/datasources/authorization_datasouce.dart';
import '../../modules/authorization/infra/repositories/authorization_repository_imp.dart';
import '../../modules/home/presenter/cubit/home_cubit.dart';
import '../../modules/music/domain/repositories/get_musics_by_artist_repository.dart';
import '../../modules/music/domain/usecases/get_musics_by_artist_usecase.dart';
import '../../modules/music/domain/usecases/get_musics_by_artist_usecase_imp.dart';
import '../../modules/music/external/stub/get_musics_by_artist_local_datasource_imp.dart';
import '../../modules/music/infra/datasources/get_musics_by_artists_datasource.dart';
import '../../modules/music/infra/repositories/get_musics_by_artist_repository_imp.dart';
import '../../modules/playlist/domain/usecases/playlist_repository.dart';
import '../../modules/playlist/external/remote/http/get_featured_playlists_http_datasource_imp.dart';
import '../../modules/playlist/infra/datasources/playlist_datasource.dart';
import '../../modules/playlist/infra/repositories/playlist_repository_imp.dart';

GetIt getIt = GetIt.I;

class Inject {
  // init all injectors
  static void init() {
    //utils

    // init all datasources
    getIt.registerLazySingleton<GetAllArtistsDataSource>(
        () => GetAllArtistsHttpDataSourceImp(getIt()));
    getIt.registerLazySingleton<GetAlbumsByArtistDataSource>(
        () => GetAlbumsByArtistLocalDataSourceImp());
    getIt.registerLazySingleton<GetMusicsByArtistDataSource>(
        () => GetMusicsByArtistLocalDataSourceImp());
    getIt.registerLazySingleton<GetAllAlbumsDataSource>(
        () => GetAllAlbumsFirebaseDataSourceImp());
    getIt.registerFactory<GetArtistTopTracksDataSource>(
        () => GetArtistTopTracksHttpDataSourceImp(getIt()));
    getIt.registerLazySingleton<AuthorizationDataSource>(() => SpotifyApi());
    getIt.registerFactory<PlaylistDataSource>(
        () => GetFeaturedPlaylistsHttpDataSourceImp());

    // init all repositories
    getIt.registerLazySingleton<ArtistRepository>(
        () => ArtistsRepositoryImp(getIt(), getIt()));
    getIt.registerLazySingleton<GetAlbumsByArtistRepository>(
        () => GetAlbumsByArtistRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetMusicsByArtistRepository>(
        () => GetMusicsByArtistRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetAllAlbumsRepository>(
        () => GetAllAlbumsRepositoryImp(getIt()));
    getIt.registerLazySingleton<AuthorizationRepository>(
        () => AuthorizationRepositoryImp(getIt()));
    getIt.registerLazySingleton<PlaylistRepository>(
        () => PlaylistRepositoryImp(getIt()));

    // init all usecases
    getIt.registerLazySingleton<GetAllArtistsUseCase>(
        () => GetAllArtistsUseCaseImp(getIt()));
    getIt.registerFactory<GetArtistTopTracksUseCase>(
        () => GetArtistTopTracksUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetAlbumsByArtistUseCase>(
        () => GetAlbumsByArtistUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetMusicsByArtistUseCase>(
        () => GetMusicsByArtistUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetAllAlbumsUseCase>(
        () => GetAllAlbumsUseCaseImp(getIt()));
    getIt.registerLazySingleton<FetchTokenUseCase>(
        () => FetchTokenUseCaseImp(getIt()));
    getIt.registerLazySingleton<FetchCodeUseCase>(
        () => FetchCodeUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetFeaturedPlaylistsUsecase>(
        () => GetFeaturedPlaylistsUsecaseImp(getIt()));
    getIt.registerFactory<RefreshTokenUseCase>(
        () => RefreshTokenUseCaseImp(getIt()));

    // init all blocs
    getIt.registerLazySingleton<HomeCubit>(
        () => HomeCubit(getIt(), getIt(), getIt(), getIt()));
    getIt.registerLazySingleton<AuthorizationCubit>(
        () => AuthorizationCubit(getIt(), getIt()));
    getIt.registerFactory<ArtistCubit>(() => ArtistCubit(getIt(), getIt()));
  }
}
