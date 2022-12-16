import 'package:flutter/material.dart';
import 'package:music_app/shared/utils/custom_colors.dart';

import '../../shared/widgets/custom_text.dart';
import '../../shared/widgets/vectors.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight - 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Row(
                children: const [
                  Expanded(
                    child: MyText(
                      'Recently played',
                      fontWeight: FontWeight.w700,
                      size: 25,
                    ),
                  ),
                  Vector(Vectors.notification),
                  SizedBox(width: 15),
                  Vector(Vectors.recently_played),
                  SizedBox(width: 15),
                  Vector(Vectors.settings),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                      10,
                      (index) => Padding(
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
                          )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Placeholder(
                    fallbackHeight: 70,
                    fallbackWidth: 70,
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                  )
                ],
              ),
            ),
            const MyText(
              'Editor\'s picks',
              fontWeight: FontWeight.w600,
              size: 30,
              margin: EdgeInsets.all(15),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                      10,
                      (index) => Padding(
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
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
