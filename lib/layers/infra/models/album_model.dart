import 'package:music_app/layers/domain/entities/album_entity.dart';

class AlbumModel extends AlbumEntity {
  AlbumModel({
    required super.id,
    required super.title,
    required super.artist,
    required super.albumArtUrl,
    required super.songCount,
    required super.duration,
    required super.releaseDate,
    required super.songs,
  });

  static AlbumModel fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      albumArtUrl: json['album_art_url'],
      songCount: json['song_count'],
      duration: json['duration'],
      releaseDate: json['release_date'],
      songs: json['songs'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album_art_url': albumArtUrl,
      'song_count': songCount,
      'duration': duration,
      'release_date': releaseDate,
      'songs': songs,
    };
  }
}
