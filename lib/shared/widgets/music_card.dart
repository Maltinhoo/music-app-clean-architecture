import 'package:flutter/material.dart';
import 'package:music_app/modules/artist/domain/entities/artist_entity.dart';

import 'custom_text.dart';

class MusicCard extends StatelessWidget {
  final ArtistEntity artist;
  const MusicCard({
    Key? key,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Placeholder(fallbackHeight: 120),
            const SizedBox(height: 10),
            MyText(
              artist.name,
              fontWeight: FontWeight.w600,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
