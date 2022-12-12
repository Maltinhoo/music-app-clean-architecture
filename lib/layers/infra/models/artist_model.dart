import 'package:music_app/layers/domain/entities/artist_entity.dart';

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
  });

  static ArtistModel fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      backgroundImageUrl: json['backgroundImageUrl'],
      monthlyListeners: json['monthlyListeners'],
      followers: json['followers'],
      bio: json['bio'],
      tags: json['tags'],
      songs: json['songs'],
      albums: json['albums'],
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
