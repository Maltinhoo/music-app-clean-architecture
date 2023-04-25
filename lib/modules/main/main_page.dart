import 'package:flutter/material.dart';
import 'package:music_app/modules/home/presenter/home_page.dart';
import 'package:music_app/modules/main/widgets/music_snack_bar.dart';
import 'package:music_app/shared/widgets/vectors.dart';

import '../search/search_page.dart';
import '../your_library/presenter/your_library_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: const [
                      TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          HomePage(),
                          SearchPage(),
                          YourLibrary(),
                        ],
                      ),
                      AnimatedPositioned(
                        bottom: -100,
                        duration: Duration(milliseconds: 300),
                        child: MusicSnackBar(),
                      )
                    ],
                  ),
                ),
                const TabBar(
                  indicatorWeight: 1,
                  indicatorColor: Colors.transparent,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  tabs: [
                    Tab(
                      icon: Vector(Vectors.home),
                      text: 'Home',
                    ),
                    Tab(
                      icon: Vector(Vectors.search),
                      text: 'Search',
                    ),
                    Tab(
                      icon: Vector(Vectors.library),
                      text: 'Your Library',
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
