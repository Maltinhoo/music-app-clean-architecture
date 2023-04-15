import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_app/modules/album/infra/models/album_model.dart';
import 'package:music_app/modules/music/infra/models/music_model.dart';

import '../../domain/entities/artist_entity.dart';

class ArtistModel extends ArtistEntity {
  ArtistModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.backgroundImageUrl,
    required super.monthlyListeners,
    required super.followers,
    required super.bio,
    required super.tags,
    required super.songs,
    required super.albums,
    required super.type,
  });

  static ArtistModel fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['images'][0]['url'],
      backgroundImageUrl: json['images'][0]['url'],
      monthlyListeners: json['monthlyListeners'] ?? 0,
      followers: json['followers']['total'],
      bio: json['bio'] ?? '',
      tags: json['genres'].cast<String>(),
      songs: json['songs'] ?? [],
      albums: json['albums'] ?? [],
      type: json['type'],
    );
  }

  static ArtistModel fromDocument(DocumentSnapshot doc) {
    return ArtistModel(
      id: doc.id,
      name: doc['name'],
      imageUrl: doc['imageUrl'],
      backgroundImageUrl: doc['backgroundImageUrl'],
      monthlyListeners: doc['monthlyListeners'],
      followers: doc['followers'],
      bio: doc['bio'],
      tags:
          (doc['tags'] as List<dynamic>).map((tag) => tag.toString()).toList(),
      songs: (doc['songs'] as List<dynamic>)
          .map((song) => MusicModel.fromJson(song))
          .toList(),
      albums: (doc['albums'] as List<dynamic>)
          .map((album) => AlbumModel.fromJson(album))
          .toList(),
      type: doc['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'backgroundImageUrl': backgroundImageUrl,
      'monthlyListeners': monthlyListeners,
      'followers': followers,
      'bio': bio,
      'tags': tags,
      'songs': songs,
      'albums': albums,
    };
  }
}
