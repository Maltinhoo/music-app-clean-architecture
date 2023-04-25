import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/modules/artist/domain/entities/artist_entity.dart';
import 'package:music_app/modules/artist/presenter/cubit/artist_cubit.dart';
import 'package:music_app/modules/artist/presenter/widgets/artist_title.dart';
import 'package:music_app/modules/music/infra/models/music_model.dart';
import 'package:music_app/shared/widgets/custom_text.dart';
import 'package:music_app/shared/widgets/play_app_bar.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../core/inject/intect.dart';
import '../../../shared/widgets/music_tack.dart';

class ArtistPage extends StatefulWidget {
  static const routeName = '/artist';

  final ArtistEntity artist;

  const ArtistPage({super.key, required this.artist});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  PaletteGenerator? paletteGenerator;
  ScrollController scrollController = ScrollController();

  double imageOpacity = 1;
  bool showTopBar = false;
  double containerHeight = 400;
  double containerinitalHeight = 400;

  Future<void> _updatePaletteGenerator(ImageProvider image) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      image,
      maximumColorCount: 5,
    );
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(() {
      imageOpacity = 1 - (scrollController.offset / 100);
      containerHeight = containerinitalHeight - scrollController.offset;
      if (containerHeight < 0) {
        containerHeight = 0;
      }
      if (scrollController.offset > 115) {
        showTopBar = true;
      } else {
        showTopBar = false;
      }
      setState(() {});
    });

    _updatePaletteGenerator(
      CachedNetworkImageProvider(widget.artist.imageUrl),
    );
    super.initState();
  }

  Color get palletColor {
    if (paletteGenerator?.paletteColors.isNotEmpty ?? false) {
      return paletteGenerator?.colors.last ?? Colors.black.withOpacity(.5);
    } else {
      return const Color(0xff575757);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            getIt<ArtistCubit>()..initializeArtist(widget.artist.id),
        child: BlocBuilder<ArtistCubit, ArtistState>(
          builder: (context, state) {
            if (state is ArtistLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Scaffold(
                body: Stack(
              children: [
                Container(
                  height: containerHeight,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  color: palletColor,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  controller: scrollController,
                  child: Column(
                    children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(1),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ArtistTitle(
                              imageOpacity: imageOpacity,
                              artist: widget.artist,
                            ),
                            MyText(
                              '${widget.artist.followers} seguidores',
                              fontWeight: FontWeight.w500,
                              size: 20,
                              margin: const EdgeInsets.only(left: 10, top: 10),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              (state as ArtistLoadedState).topTracks.length,
                              (index) => MusicTrack(
                                    music:
                                        (state).topTracks[index] as MusicModel,
                                  )),
                        ),
                      )
                    ],
                  ),
                ),
                PlayAppBar(
                  showTopBar: showTopBar,
                  palletColor: palletColor,
                  containerHeight: containerHeight,
                  title: widget.artist.name,
                )
              ],
            ));
          },
        ),
      ),
    );
  }
}
