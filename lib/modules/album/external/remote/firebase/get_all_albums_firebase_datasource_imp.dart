import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../infra/datasources/get_all_albums_datasource.dart';
import '../../../infra/models/album_model.dart';

class GetAllAlbumsFirebaseDataSourceImp implements GetAllAlbumsDataSource {
  final firestore = FirebaseFirestore.instance;

  GetAllAlbumsFirebaseDataSourceImp();

  @override
  Future<List<AlbumModel>> call() async {
    final result = await firestore.collection('albums').get();
    return result.docs.map((album) => AlbumModel.fromDocument(album)).toList();
  }
}
