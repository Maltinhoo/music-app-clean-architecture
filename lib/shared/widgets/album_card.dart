import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';
import 'custom_text.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Placeholder(
            fallbackHeight: 70,
            fallbackWidth: 70,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyText(
                '#SPOTIFYWRAPPED',
                fontWeight: FontWeight.w400,
                size: 15,
                color: CustomColors.grey2,
              ),
              MyText(
                'Your 2021 in review',
                fontWeight: FontWeight.w600,
                size: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
