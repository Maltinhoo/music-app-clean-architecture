import '../../../music/infra/models/music_model.dart';

abstract class GetArtistTopTracksDataSource {
  Future<List<MusicModel>> call(String artistId);
}
