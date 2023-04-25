import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/modules/artist/domain/entities/artist_entity.dart';

import '../../../../shared/widgets/custom_text.dart';

class ArtistTitle extends StatelessWidget {
  final double imageOpacity;
  final ArtistEntity artist;
  const ArtistTitle({
    super.key,
    required this.imageOpacity,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: imageOpacity.clamp(0.0, 1.0),
          duration: const Duration(milliseconds: 500),
          child: CachedNetworkImage(
            imageUrl: artist.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: SizedBox(
            width: 160,
            child: MyText(
              artist.name,
              fontWeight: FontWeight.w700,
              size: 45,
              textAlign: TextAlign.left,
              color: Colors.white.withOpacity(imageOpacity.clamp(0.0, 1.0)),
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(imageOpacity.clamp(0.0, 1.0)),
                  offset: const Offset(2, 2),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
