import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';
import 'custom_text.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Placeholder(fallbackHeight: 160),
            SizedBox(height: 10),
            MyText(
              'Ed Sheeran, Big Sean, Juice WRLD, Post Malone',
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
