import 'package:flutter/material.dart';

import '../../../shared/utils/custom_colors.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 180,
          height: 110,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(3))),
        ),
        Positioned(
          bottom: 5,
          right: -20,
          child: Transform.rotate(
            angle: .4,
            child: Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(color: CustomColors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.5),
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: const Offset(0, 5),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
