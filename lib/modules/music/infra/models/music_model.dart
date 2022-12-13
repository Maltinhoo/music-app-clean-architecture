import '../../domain/entities/music_entity.dart';

class MusicModel extends MusicEntity {
  MusicModel({
    required super.id,
    required super.title,
    required super.artist,
    required super.album,
    required super.duration,
    required super.reproductionCount,
    required super.isExplicit,
  });

  static MusicModel fromJson(Map<String, dynamic> json) {
    return MusicModel(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      duration: json['duration'],
      reproductionCount: json['reproduction_count'],
      isExplicit: json['is_explicit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'duration': duration,
      'reproduction_count': reproductionCount,
      'is_explicit': isExplicit,
    };
  }
}
