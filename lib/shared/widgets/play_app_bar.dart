import 'package:flutter/material.dart';
import 'package:music_app/shared/widgets/random_play_button.dart';

import 'custom_text.dart';

class PlayAppBar extends StatelessWidget {
  final bool showTopBar;
  final Color palletColor;
  final double containerHeight;
  final String title;

  const PlayAppBar({
    super.key,
    required this.showTopBar,
    required this.palletColor,
    required this.containerHeight,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: showTopBar ? palletColor : Colors.transparent,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.keyboard_arrow_left,
                  size: 38,
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: showTopBar ? 1 : 0,
              child: MyText(
                title,
                textStyle: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 80 - containerHeight.clamp(120, double.infinity),
              child: const RandomPlayButton(),
            )
          ],
        ),
      ),
    );
  }
}
