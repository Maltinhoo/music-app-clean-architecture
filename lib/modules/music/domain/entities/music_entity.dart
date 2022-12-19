class MusicEntity {
  String id;
  String title;
  List<String> artists;
  String albumId;
  String duration;
  int reproductionCount;
  bool isExplicit;

  MusicEntity({
    required this.id,
    required this.title,
    required this.artists,
    required this.albumId,
    required this.duration,
    required this.reproductionCount,
    required this.isExplicit,
  });
}
