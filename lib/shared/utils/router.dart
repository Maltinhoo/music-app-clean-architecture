import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:music_app/modules/artist/presenter/artist_page.dart';
import 'package:music_app/modules/playlist/presenter/playlist_page.dart';

import '../../modules/album/presenter/album_page.dart';
import '../../modules/home/presenter/home_page.dart';
import '../../modules/main/main_page.dart';
import '../widgets/custom_text.dart';

class AppRouter {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;

    try {
      late final Widget page;
      log("AppRouter.generateRoute: ${settings.name}");
      switch (settings.name) {
        case '/':
          page = const MainPage();
          break;
        case HomePage.routeName:
          page = const HomePage();
          break;
        case AlbumPage.routeName:
          page = AlbumPage(album: args!['album']);
          break;
        case ArtistPage.routeName:
          page = ArtistPage(artist: args!['artist']);
          break;

        case PlaylistPage.routeName:
          page = PlaylistPage(playlist: args!['playlist']);
          break;

        default:
          page = const Scaffold(
            body: Center(
              child: MyText('Page not found'),
            ),
          );
      }
      return MaterialPageRoute(
        builder: (_) => page,
      );
    } catch (e) {
      log("AppRouter.generateRoute: $e");
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: MyText('Page not found'),
          ),
        ),
      );
    }
  }
}
