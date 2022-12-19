import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../infra/datasources/get_all_albums_datasource.dart';
import '../../../infra/models/album_model.dart';

class GetAllAlbumsFirebaseDataSourceImp implements GetAllAlbumsDataSource {
  final firestore = FirebaseFirestore.instance;

  GetAllAlbumsFirebaseDataSourceImp();

  @override
  Future<Either<Exception, List<AlbumModel>>> call() async {
    try {
      var result = await firestore.collection('albums').get();
      var allAlbums =
          result.docs.map((album) => AlbumModel.fromDocument(album)).toList();
      return Right(allAlbums);
    } catch (e) {
      return Left(Exception('Error while getting albums'));
    }
  }
}
