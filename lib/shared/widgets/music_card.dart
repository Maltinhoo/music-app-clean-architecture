import 'package:flutter/material.dart';
import 'package:music_app/modules/music/domain/entities/music_entity.dart';

import 'custom_text.dart';

class MusicCard extends StatelessWidget {
  final MusicEntity music;
  const MusicCard({
    Key? key,
    required this.music,
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
              music.title,
              fontWeight: FontWeight.w600,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
