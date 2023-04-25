import 'package:music_app/modules/playlist/domain/entities/playlist_entity.dart';

class PlaylistModel extends PlaylistEntity {
  PlaylistModel(
      {required super.id,
      required super.name,
      required super.imageUrl,
      required super.description,
      required super.type,
      required super.totalTracks});

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['images'][0]['url'],
      description: json['description'],
      type: json['type'],
      totalTracks: json['tracks']['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'name': super.name,
      'images': [
        {'url': super.imageUrl}
      ],
      'description': super.description,
      'type': super.type,
      'tracks': {'total': super.totalTracks},
    };
  }
}
