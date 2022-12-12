import 'package:get_it/get_it.dart';
import 'package:music_app/layers/domain/repositories/get_albums_by_artist_repository.dart';
import 'package:music_app/layers/domain/repositories/get_all_artists_repository.dart';
import 'package:music_app/layers/domain/repositories/get_musics_by_artist_repository.dart';
import 'package:music_app/layers/domain/usecases/get_albums_by_artist/get_albums_by_artist_usecase.dart';
import 'package:music_app/layers/domain/usecases/get_albums_by_artist/get_albums_by_artist_usecase_imp.dart';
import 'package:music_app/layers/domain/usecases/get_all_artists/get_all_artists_usecase.dart';
import 'package:music_app/layers/infra/datasources/get_all_artists_datasource.dart';
import 'package:music_app/layers/infra/repositories/get_albums_by_artist_repository_imp.dart';
import 'package:music_app/layers/infra/repositories/get_musics_by_artist_repository_imp.dart';

import '../../layers/domain/usecases/get_all_artists/get_all_artists_usecase_imp.dart';
import '../../layers/domain/usecases/get_musics_by_artist/get_musics_by_artist_usecase.dart';
import '../../layers/domain/usecases/get_musics_by_artist/get_musics_by_artist_usecase_imp.dart';
import '../../layers/external/local/get_albums_by_artist_local_datasource_imp.dart';
import '../../layers/external/local/get_all_artists_local_datasource_imp.dart';
import '../../layers/external/local/get_musics_by_artist_local_datasource_imp.dart';
import '../../layers/infra/datasources/get_albums_by_artist_datasource.dart';
import '../../layers/infra/datasources/get_musics_by_artists_datasource.dart';
import '../../layers/infra/repositories/get_all_artists_repository_imp.dart';

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
