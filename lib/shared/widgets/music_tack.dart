import 'package:flutter/material.dart';
import 'package:music_app/shared/widgets/bounce_widget.dart';

import '../utils/custom_colors.dart';
import 'custom_text.dart';

class MusicTrack extends StatelessWidget {
  const MusicTrack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  MyText(
                    'Love Me Do - Mono / Remastered',
                    size: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  MyText(
                    'Love Me Do - Mono / Remastered',
                    size: 14,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.grey3,
                  ),
                ],
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
