import '../../domain/entities/music_entity.dart';

class MusicModel extends MusicEntity {
  MusicModel({
    required super.id,
    required super.title,
    required super.albumId,
    required super.imageUrl,
    required super.previewUrl,
    required super.artists,
  });

  static MusicModel fromJson(Map<String, dynamic> json) {
    print((json['artists'] as List<dynamic>).map((e) => e['name']).toList());
    return MusicModel(
      id: json['id'],
      title: json['name'],
      albumId: json['album']['id'],
      imageUrl: json['album']['images'][0]['url'],
      previewUrl: json['preview_url'] ?? '',
      artists: (json['artists'] as List<dynamic>)
          .map((e) => e['name'].toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'albumId': albumId,
      'imageUrl': imageUrl,
      'previewUrl': previewUrl,
    };
  }
}
