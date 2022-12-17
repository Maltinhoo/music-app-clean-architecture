import 'package:flutter/material.dart';

import 'custom_text.dart';

class MusicCard extends StatelessWidget {
  final int index;
  const MusicCard({
    Key? key,
    required this.index,
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
              'Title $index',
              fontWeight: FontWeight.w600,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
