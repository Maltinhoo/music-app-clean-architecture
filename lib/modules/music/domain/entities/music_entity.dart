import '../../../album/domain/entities/album_entity.dart';
import '../../../artist/domain/entities/artist_entity.dart';

class MusicEntity {
  String id;
  String title;
  ArtistEntity artist;
  AlbumEntity album;
  String duration;
  int reproductionCount;
  bool isExplicit;

  MusicEntity({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    required this.reproductionCount,
    required this.isExplicit,
  });
}
