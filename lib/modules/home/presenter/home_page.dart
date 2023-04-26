import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/inject/intect.dart';
import 'package:music_app/modules/playlist/infra/models/playlist_model.dart';
import 'package:music_app/shared/widgets/playlist_card.dart';

import '../../../shared/widgets/album_card.dart';
import '../../../shared/widgets/artist_circular.dart';
import '../../../shared/widgets/custom_text.dart';
import '../../../shared/widgets/vectors.dart';
import '../../album/presenter/album_page.dart';
import '../../artist/presenter/artist_page.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<HomeCubit>()..loadAllData(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.only(top: kToolbarHeight - 30),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitlePage(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: List.generate(
                            (state as HomeLoadedState).playlists.length,
                            (index) => PlaylistCard(
                                  playlist:
                                      (state).playlists[index] as PlaylistModel,
                                )),
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
                      child: Row(children: [
                        ...(state).albums.map((album) => AlbumCard(
                              album: album,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AlbumPage.routeName,
                                    arguments: {'album': album});
                              },
                            ))
                      ]),
                    ),
                    const SizedBox(height: 15),
                    const MyText(
                      'Seus artistas favoritos',
                      fontWeight: FontWeight.w600,
                      size: 30,
                      margin: EdgeInsets.all(15),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...(state).artists.map((artist) => ArtistCircular(
                                artist: artist,
                                onTap: () => Navigator.pushNamed(
                                    context, ArtistPage.routeName,
                                    arguments: {'artist': artist}),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
