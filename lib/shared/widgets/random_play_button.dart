import 'package:flutter/material.dart';

class RandomPlayButton extends StatelessWidget {
  const RandomPlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 64,
          height: 64,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff14D860),
          ),
          child: const Icon(
            Icons.play_arrow,
            size: 38,
          ),
        ),
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Icon(
            Icons.shuffle,
            color: Colors.black,
            size: 14,
          ),
        )
      ],
    );
  }
}
