import 'package:bloc/bloc.dart';
import 'package:music_app/modules/artist/domain/usecases/get_all_artists_usecase.dart';

import '../../artist/domain/entities/artist_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllArtistsUseCase getAllArtistsUseCase;
  HomeCubit(this.getAllArtistsUseCase) : super(HomeInitial());

  Future<void> getAllArtists() async {
    emit(LoadingArtistsState());
    final result = await getAllArtistsUseCase.call();
    result.fold(
        (error) => Exception('Erro'),
        (success) => success.isEmpty
            ? emit(EmptyArtistsState())
            : emit(SuccessArtistsState(success)));
  }
}
