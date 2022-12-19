import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/album_entity.dart';

class AlbumModel extends AlbumEntity {
  AlbumModel({
    required super.id,
    required super.title,
    required super.artists,
    required super.albumArtUrl,
    required super.duration,
    required super.releaseDate,
    required super.songs,
  });

  static AlbumModel fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'],
      title: json['title'],
      artists: json['artists'],
      albumArtUrl: json['albumArtUrl'],
      duration: json['duration'],
      releaseDate: json['releaseDate'],
      songs: json['songs'],
    );
  }

  static AlbumModel fromDocument(DocumentSnapshot doc) {
    return AlbumModel(
      id: doc.id,
      title: doc['title'],
      artists: (doc['artists'] as List<dynamic>)
          .map((artist) => artist.toString())
          .toList(),
      albumArtUrl: doc['albumArtUrl'],
      duration: doc['duration'],
      releaseDate: (doc['releaseDate'] as Timestamp).toDate(),
      songs: (doc['songs'] as List<dynamic>)
          .map((song) => song.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artists': artists,
      'albumArtUrl': albumArtUrl,
      'duration': duration,
      'releaseDate': releaseDate,
      'songs': songs,
    };
  }
}
