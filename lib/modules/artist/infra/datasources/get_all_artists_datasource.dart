import '../models/artist_model.dart';

abstract class GetAllArtistsDataSource {
  Future<List<ArtistModel>> call();
}
