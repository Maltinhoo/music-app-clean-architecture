import 'package:flutter/material.dart';
import 'package:music_app/shared/utils/custom_colors.dart';
import 'package:music_app/shared/widgets/bounce_widget.dart';
import 'package:music_app/shared/widgets/custom_text.dart';
import 'package:music_app/shared/widgets/vectors.dart';

import '../../../shared/widgets/album_card.dart';

class YourLibrary extends StatefulWidget {
  static const routeName = '/yourLibrary';
  const YourLibrary({super.key});

  @override
  State<YourLibrary> createState() => _YourLibraryState();
}

class _YourLibraryState extends State<YourLibrary> {
  late IconData _icon;

  void changeListFormat() {
    setState(() {
      _icon = _icon == Icons.grid_view_outlined
          ? Icons.list_rounded
          : Icons.grid_view_outlined;
    });
  }

  @override
  void initState() {
    super.initState();
    _icon = Icons.grid_view_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kToolbarHeight - 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const [
              CircleAvatar(
                child: MyText('M'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: MyText(
                  'Your Library',
                  size: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Vector(Vectors.search),
              SizedBox(width: 25),
              Icon(Icons.add)
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 20, top: 30, bottom: 10),
          child: Row(
            children: [
              ...List.generate(
                  5,
                  (index) => Bouncing(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomColors.grey2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const MyText(
                            'Playlists',
                            size: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
            ],
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Vector(
                            Vectors.up_down_arrows,
                            size: 20,
                          ),
                          const MyText(
                            'Recently played',
                            size: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          const Expanded(child: SizedBox()),
                          Bouncing(
                            onTap: () => changeListFormat(),
                            child: Icon(_icon),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 70),
                      child: _icon == Icons.grid_view_outlined
                          ? Wrap(
                              runSpacing: 10,
                              spacing: 20,
                              children: const [
                                SizedBox(
                                  width: 160,
                                  height: 160,
                                  child: Placeholder(),
                                ),
                                SizedBox(
                                  width: 160,
                                  height: 160,
                                  child: Placeholder(),
                                ),
                              ],
                            )
                          : Column(
                              children: const [
                                AlbumCard(),
                                AlbumCard(),
                              ],
                            ),
                    ),
                  ],
                )))
      ],
    );
  }
}
