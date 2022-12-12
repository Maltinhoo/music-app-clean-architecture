import 'package:music_app/layers/domain/entities/music_entity.dart';

class AlbumEntity {
  String id;
  String title;
  String artist;
  String albumArtUrl;
  String songCount;
  String duration;
  DateTime releaseDate;
  List<MusicEntity> songs;

  AlbumEntity({
    required this.id,
    required this.title,
    required this.artist,
    required this.albumArtUrl,
    required this.songCount,
    required this.duration,
    required this.releaseDate,
    required this.songs,
  });
}
