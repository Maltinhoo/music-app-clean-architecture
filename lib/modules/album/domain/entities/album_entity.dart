class AlbumEntity {
  String id;
  String title;
  List<String> artists;
  String albumArtUrl;
  String duration;
  DateTime releaseDate;
  List<String> songs;

  AlbumEntity({
    required this.id,
    required this.title,
    required this.artists,
    required this.albumArtUrl,
    required this.duration,
    required this.releaseDate,
    required this.songs,
  });
}
