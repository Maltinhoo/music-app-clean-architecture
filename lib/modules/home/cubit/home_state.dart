part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class SuccessArtistsState extends HomeState {
  final List<ArtistEntity> allArtists;
  SuccessArtistsState(this.allArtists);

  @override
  List<Object?> get props => [allArtists];
}

class EmptyArtistsState extends SuccessArtistsState {
  EmptyArtistsState() : super([]);
}

class LoadingArtistsState extends HomeState {
  @override
  List<Object?> get props => [];
}

class ErrorArtistsState extends HomeState {
  final String message;

  ErrorArtistsState(this.message);

  @override
  List<Object?> get props => [message];
}
