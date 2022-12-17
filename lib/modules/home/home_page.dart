import 'package:flutter/material.dart';

import '../../shared/widgets/album_card.dart';
import '../../shared/widgets/custom_text.dart';
import '../../shared/widgets/music_card.dart';
import '../../shared/widgets/playlist_card.dart';
import '../../shared/widgets/vectors.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight - 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitlePage(),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(10, (index) => MusicCard(index: index)),
              ),
            ),
            const AlbumCard(),
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
                children: List.generate(10, (index) => const PlaylistCard()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitlePage() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Row(
        children: const [
          Expanded(
            child: MyText(
              'Recently played',
              fontWeight: FontWeight.w700,
              size: 28,
            ),
          ),
          Vector(Vectors.notification),
          SizedBox(width: 15),
          Vector(Vectors.recently_played),
          SizedBox(width: 15),
          Vector(Vectors.settings),
        ],
      ),
    );
  }
}
