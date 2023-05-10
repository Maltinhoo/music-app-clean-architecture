part of 'playlist_cubit.dart';

@immutable
abstract class PlaylistState {}

class PlaylistInitial extends PlaylistState {}

class PlaylistLoading extends PlaylistState {}

class PlaylistLoaded extends PlaylistState {
  final List<MusicEntity> musics;

  PlaylistLoaded(this.musics);
}

class PlaylistError extends PlaylistState {
  final String message;

  PlaylistError(this.message);
}
