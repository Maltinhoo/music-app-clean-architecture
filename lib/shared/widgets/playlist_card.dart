import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/modules/album/domain/entities/album_entity.dart';
import 'package:music_app/shared/widgets/bounce_widget.dart';

import '../utils/custom_colors.dart';

class PlaylistCard extends StatelessWidget {
  final AlbumEntity album;
  final VoidCallback onTap;
  const PlaylistCard({
    Key? key,
    required this.album,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Bouncing(
        onTap: onTap,
        child: SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: album.albumArtUrl,
                height: 160,
              ),
              const SizedBox(height: 10),
              RichText(
                  text: TextSpan(
                style: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  ...album.artists.map((artist) => TextSpan(
                        onEnter: (event) => print('onEnter'),
                        text: album.artists.length > 1 ? '$artist ' : artist,
                        style: const TextStyle(
                          color: CustomColors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
