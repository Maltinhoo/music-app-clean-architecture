import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/modules/music/infra/models/music_model.dart';
import 'package:music_app/shared/widgets/bounce_widget.dart';

import '../utils/custom_colors.dart';
import 'custom_text.dart';

class MusicTrack extends StatelessWidget {
  final MusicModel music;
  const MusicTrack({
    Key? key,
    required this.music,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: music.imageUrl,
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: MyText(
                music.title,
                size: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Bouncing(
              child: Icon(
                Icons.more_horiz,
                color: CustomColors.grey3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
