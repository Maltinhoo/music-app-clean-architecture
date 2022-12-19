import '../../../album/domain/entities/album_entity.dart';
import '../../../music/domain/entities/music_entity.dart';

class ArtistEntity {
  String id;
  String name;
  String imageUrl;
  String backgroundImageUrl;
  int monthlyListeners;
  int followers;
  String bio;
  List<String> tags;
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
