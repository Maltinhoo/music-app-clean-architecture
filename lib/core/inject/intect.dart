import 'package:get_it/get_it.dart';
import 'package:music_app/modules/album/domain/repositories/get_all_albums_repository.dart';
import 'package:music_app/modules/album/domain/usecases/get_all_albums/get_all_albums_usecase.dart';
import 'package:music_app/modules/album/external/remote/firebase/get_all_albums_firebase_datasource_imp.dart';
import 'package:music_app/modules/album/infra/datasources/get_all_albums_datasource.dart';

import '../../modules/album/domain/repositories/get_albums_by_artist_repository.dart';
import '../../modules/album/domain/usecases/get_albums_by_artist/get_albums_by_artist_usecase.dart';
import '../../modules/album/domain/usecases/get_albums_by_artist/get_albums_by_artist_usecase_imp.dart';
import '../../modules/album/domain/usecases/get_all_albums/get_all_albums_usecase_imp.dart';
import '../../modules/album/external/stub/get_albums_by_artist_local_datasource_imp.dart';
import '../../modules/album/infra/datasources/get_albums_by_artist_datasource.dart';
import '../../modules/album/infra/repositories/get_albums_by_artist_repository_imp.dart';
import '../../modules/album/infra/repositories/get_all_albums_repository_imp.dart';
import '../../modules/artist/domain/repositories/get_all_artists_repository.dart';
import '../../modules/artist/domain/usecases/get_all_artists_usecase.dart';
import '../../modules/artist/domain/usecases/get_all_artists_usecase_imp.dart';
import '../../modules/artist/external/remote/firebase/get_all_artists_firebase_datasource_imp.dart';
import '../../modules/artist/infra/datasources/get_all_artists_datasource.dart';
import '../../modules/artist/infra/repositories/get_all_artists_repository_imp.dart';
import '../../modules/home/cubit/home_cubit.dart';
import '../../modules/music/domain/repositories/get_musics_by_artist_repository.dart';
import '../../modules/music/domain/usecases/get_musics_by_artist_usecase.dart';
import '../../modules/music/domain/usecases/get_musics_by_artist_usecase_imp.dart';
import '../../modules/music/external/stub/get_musics_by_artist_local_datasource_imp.dart';
import '../../modules/music/infra/datasources/get_musics_by_artists_datasource.dart';
import '../../modules/music/infra/repositories/get_musics_by_artist_repository_imp.dart';

GetIt getIt = GetIt.I;

class Inject {
  // init all injectors
  static void init() {
    //utils

    // init all datasources
    getIt.registerLazySingleton<GetAllArtistsDataSource>(
        () => GetAllArtistsFirebaseDataSourceImp());
    getIt.registerLazySingleton<GetAlbumsByArtistDataSource>(
        () => GetAlbumsByArtistLocalDataSourceImp());
    getIt.registerLazySingleton<GetMusicsByArtistDataSource>(
        () => GetMusicsByArtistLocalDataSourceImp());
    getIt.registerLazySingleton<GetAllAlbumsDataSource>(
        () => GetAllAlbumsFirebaseDataSourceImp());

    // init all repositories
    getIt.registerLazySingleton<GetAllArtistsRepository>(
        () => GetAllArtistsRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetAlbumsByArtistRepository>(
        () => GetAlbumsByArtistRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetMusicsByArtistRepository>(
        () => GetMusicsByArtistRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetAllAlbumsRepository>(
        () => GetAllAlbumsRepositoryImp(getIt()));

    // init all usecases
    getIt.registerLazySingleton<GetAllArtistsUseCase>(
        () => GetAllArtistsUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetAlbumsByArtistUseCase>(
        () => GetAlbumsByArtistUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetMusicsByArtistUseCase>(
        () => GetMusicsByArtistUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetAllAlbumsUseCase>(
        () => GetAllAlbumsUseCaseImp(getIt()));

    // init all blocs
    getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt(), getIt()));
  }
}
