import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:music_app/modules/artist/infra/models/artist_model.dart';

import '../../../infra/datasources/get_all_artists_datasource.dart';

class GetAllArtistsFirebaseDataSourceImp implements GetAllArtistsDataSource {
  final firestore = FirebaseFirestore.instance;
  GetAllArtistsFirebaseDataSourceImp();

  @override
  Future<Either<Exception, List<ArtistModel>>> call() async {
    try {
      var result = await firestore.collection('artists').get();
      var allArtists = result.docs
          .map((artist) => ArtistModel.fromDocument(artist))
          .toList();
      return Right(allArtists);
    } catch (e) {
      return Left(Exception('Error while getting artists'));
    }
  }
}
