class PlaylistEntity {
  String id;
  String name;
  String imageUrl;
  String description;
  String type;
  int totalTracks;

  PlaylistEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.type,
    required this.totalTracks,
  });
}
