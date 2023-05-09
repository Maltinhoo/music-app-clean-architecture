import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_app/modules/artist/infra/models/artist_model.dart';

import '../../../infra/datasources/get_all_artists_datasource.dart';

class GetAllArtistsFirebaseDataSourceImp implements GetAllArtistsDataSource {
  final firestore = FirebaseFirestore.instance;
  GetAllArtistsFirebaseDataSourceImp();

  @override
  Future<List<ArtistModel>> call() async {
    final result = await firestore.collection('artists').get();
    return result.docs
        .map((artist) => ArtistModel.fromJson(artist.data()))
        .toList();
  }
}
