import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/modules/artist/domain/entities/artist_entity.dart';
import 'package:music_app/shared/widgets/bounce_widget.dart';

import '../utils/custom_colors.dart';
import 'custom_text.dart';

class ArtistCircular extends StatelessWidget {
  final ArtistEntity artist;
  final VoidCallback onTap;
  const ArtistCircular({
    Key? key,
    required this.artist,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onTap: onTap,
      child: Container(
        width: 160,
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: artist.imageUrl,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 10),
            MyText(
              artist.name,
              fontWeight: FontWeight.w500,
              size: 22,
              maxLines: 2,
              color: CustomColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
