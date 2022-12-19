import 'package:flutter/material.dart';
import 'package:music_app/modules/album/domain/entities/album_entity.dart';

import '../utils/custom_colors.dart';
import 'custom_text.dart';

class PlaylistCard extends StatelessWidget {
  final AlbumEntity album;
  const PlaylistCard({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Placeholder(fallbackHeight: 160),
            const SizedBox(height: 10),
            MyText(
              album.artists[0],
              fontWeight: FontWeight.w500,
              size: 18,
              maxLines: 2,
              color: CustomColors.grey3,
            ),
          ],
        ),
      ),
    );
  }
}
