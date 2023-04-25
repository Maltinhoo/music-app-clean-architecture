part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<ArtistEntity> artists;
  final List<AlbumEntity> albums;
  final List<PlaylistEntity> playlists;

  HomeLoadedState(this.artists, this.albums, this.playlists);

  List<Object?> get props => [artists, albums, playlists];
}

class HomeLoadingState extends HomeState {
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);

  List<Object?> get props => [message];
}
