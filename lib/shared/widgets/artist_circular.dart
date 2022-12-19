import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/modules/artist/domain/entities/artist_entity.dart';

import '../utils/custom_colors.dart';
import 'custom_text.dart';

class ArtistCircular extends StatelessWidget {
  final ArtistEntity artist;
  const ArtistCircular({
    Key? key,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: CachedNetworkImage(
              imageUrl: artist.imageUrl,
              height: 160,
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
    );
  }
}
