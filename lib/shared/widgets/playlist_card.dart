import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_app/modules/playlist/infra/models/playlist_model.dart';

import 'custom_text.dart';

class PlaylistCard extends StatelessWidget {
  final PlaylistModel playlist;
  const PlaylistCard({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 180,
        decoration: BoxDecoration(
            color: const Color(0xff414141),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              child: CachedNetworkImage(
                imageUrl: playlist.imageUrl,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MyText(
                playlist.name,
                fontWeight: FontWeight.w600,
                size: 20,
              ),
            )
          ],
        ));
  }
}
