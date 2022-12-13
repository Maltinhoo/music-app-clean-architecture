import 'package:get_it/get_it.dart';

import '../../modules/album/domain/repositories/get_albums_by_artist_repository.dart';
import '../../modules/album/domain/usecases/get_albums_by_artist_usecase.dart';
import '../../modules/album/domain/usecases/get_albums_by_artist_usecase_imp.dart';
import '../../modules/album/external/stub/get_albums_by_artist_local_datasource_imp.dart';
import '../../modules/album/infra/datasources/get_albums_by_artist_datasource.dart';
import '../../modules/album/infra/repositories/get_albums_by_artist_repository_imp.dart';
import '../../modules/artist/domain/repositories/get_all_artists_repository.dart';
import '../../modules/artist/domain/usecases/get_all_artists_usecase.dart';
import '../../modules/artist/domain/usecases/get_all_artists_usecase_imp.dart';
import '../../modules/artist/external/stub/get_all_artists_local_datasource_imp.dart';
import '../../modules/artist/infra/datasources/get_all_artists_datasource.dart';
import '../../modules/artist/infra/repositories/get_all_artists_repository_imp.dart';
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
        () => GetAllArtistsLocalDataSourceImp());
    getIt.registerLazySingleton<GetAlbumsByArtistDataSource>(
        () => GetAlbumsByArtistLocalDataSourceImp());
    getIt.registerLazySingleton<GetMusicsByArtistDataSource>(
        () => GetMusicsByArtistLocalDataSourceImp());

    // init all repositories
    getIt.registerLazySingleton<GetAllArtistsRepository>(
        () => GetAllArtistsRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetAlbumsByArtistRepository>(
        () => GetAlbumsByArtistRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetMusicsByArtistRepository>(
        () => GetMusicsByArtistRepositoryImp(getIt()));

    // init all usecases
    getIt.registerLazySingleton<GetAllArtistsUseCase>(
        () => GetAllArtistsUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetAlbumsByArtistUseCase>(
        () => GetAlbumsByArtistUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetMusicsByArtistUseCase>(
        () => GetMusicsByArtistUseCaseImp(getIt()));

    // init all blocs
  }
}
