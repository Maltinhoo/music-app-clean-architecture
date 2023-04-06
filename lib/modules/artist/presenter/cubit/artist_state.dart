part of 'artist_cubit.dart';

@immutable
abstract class ArtistState {}

class ArtistInitial extends ArtistState {}

class ArtistLoadingState extends ArtistState {}

class ArtistLoadedState extends ArtistState {
  final List<MusicEntity> musics;

  ArtistLoadedState(this.musics);
}

class ArtistErrorState extends ArtistState {
  final String message;

  ArtistErrorState(this.message);
}
