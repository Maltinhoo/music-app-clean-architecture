import 'package:dartz/dartz.dart';
import 'package:music_app/modules/artist/infra/models/artist_model.dart';

import '../../../infra/datasources/get_all_artists_datasource.dart';

class GetAllArtistsFirebaseDataSourceImp implements GetAllArtistsDataSource {
  GetAllArtistsFirebaseDataSourceImp();

  @override
  Future<Either<Exception, List<ArtistModel>>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
