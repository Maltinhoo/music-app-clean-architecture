class MusicEntity {
  String id;
  String title;
  String albumId;
  String imageUrl;
  String previewUrl;
  List<String> artists;

  MusicEntity({
    required this.id,
    required this.title,
    required this.albumId,
    required this.imageUrl,
    required this.previewUrl,
    required this.artists,
  });
}
