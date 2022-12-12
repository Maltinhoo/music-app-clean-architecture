// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:music_app/layers/domain/entities/album_entity.dart';

import 'music_entity.dart';

class ArtistEntity {
  String id;
  String name;
  String imageUrl;
  String backgroundImageUrl;
  int monthlyListeners;
  int followers;
  String bio;
  String tags;
  List<MusicEntity> songs;
  List<AlbumEntity> albums;

  ArtistEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.backgroundImageUrl,
    required this.monthlyListeners,
    required this.followers,
    required this.bio,
    required this.tags,
    required this.songs,
    required this.albums,
  });
}
