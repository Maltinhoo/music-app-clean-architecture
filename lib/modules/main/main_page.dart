import 'package:flutter/material.dart';
import 'package:music_app/modules/home/home_page.dart';
import 'package:music_app/shared/widgets/vectors.dart';

import '../../shared/widgets/custom_text.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: const [
                Expanded(
                  child: TabBarView(
                    children: [
                      HomePage(),
                      Center(child: MyText('Search')),
                      Center(child: MyText('Library')),
                    ],
                  ),
                ),
                TabBar(
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
