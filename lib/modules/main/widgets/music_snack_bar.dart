import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:music_app/shared/widgets/bounce_widget.dart';

import '../../../shared/utils/custom_colors.dart';
import '../../../shared/widgets/custom_text.dart';
import '../../../shared/widgets/dot_divider.dart';

class MusicSnackBar extends StatefulWidget {
  const MusicSnackBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MusicSnackBar> createState() => _MusicSnackBarState();
}

class _MusicSnackBarState extends State<MusicSnackBar>
    with TickerProviderStateMixin {
  bool _flag = true;

  late Animation<double> _myAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _myAnimation = CurvedAnimation(curve: Curves.linear, parent: _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _myAnimation.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          color: const Color(0xff0F1929),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Placeholder(
              fallbackHeight: 40,
              fallbackWidth: 40,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Marquee(
                    autoRepeat: true,
                    direction: Axis.horizontal,
                    animationDuration: const Duration(seconds: 5),
                    pauseDuration: const Duration(seconds: 0),
                    directionMarguee: DirectionMarguee.TwoDirection,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        MyText(
                          'Manha',
                          fontWeight: FontWeight.w700,
                          size: 18,
                        ),
                        DotDivider(),
                        MyText(
                          'Teto',
                          fontWeight: FontWeight.w700,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Bouncing(
              onTap: () {
                if (_flag) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
                _flag = !_flag;
              },
              child: AnimatedIcon(
                color: CustomColors.white,
                size: 30,
                icon: AnimatedIcons.play_pause,
                progress: _myAnimation,
              ))
        ],
      ),
    );
  }
}
