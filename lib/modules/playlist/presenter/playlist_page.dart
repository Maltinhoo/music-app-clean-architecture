import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/inject/intect.dart';
import 'package:music_app/shared/widgets/custom_text.dart';
import 'package:music_app/shared/widgets/vectors.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../shared/utils/custom_colors.dart';
import '../../../shared/widgets/custom_sliver.dart';
import '../../../shared/widgets/music_tack.dart';
import '../../../shared/widgets/play_app_bar.dart';
import '../../music/infra/models/music_model.dart';
import '../infra/models/playlist_model.dart';
import 'cubit/playlist_cubit.dart';

class PlaylistPage extends StatefulWidget {
  static const routeName = '/playlist';

  final PlaylistModel playlist;
  const PlaylistPage({super.key, required this.playlist});

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  ScrollController scrollController = ScrollController();
  double imageSize = 0;
  double initialSize = 240;
  double containerHeight = 500;
  double containerinitalHeight = 500;
  double imageOpacity = 1;
  bool showTopBar = false;

  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    imageSize = initialSize;
    scrollController.addListener(() {
      imageSize = initialSize - scrollController.offset;
      if (imageSize < 0) {
        imageSize = 0;
      }
      containerHeight = containerinitalHeight - scrollController.offset;
      if (containerHeight < 0) {
        containerHeight = 0;
      }
      imageOpacity = imageSize / initialSize;
      if (scrollController.offset > 224) {
        showTopBar = true;
      } else {
        showTopBar = false;
      }
      setState(() {});
    });
    _updatePaletteGenerator(
      CachedNetworkImageProvider(widget.playlist.imageUrl),
    );
    super.initState();
  }

  Future<void> _updatePaletteGenerator(ImageProvider image) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      image,
      maximumColorCount: 5,
    );
    setState(() {});
  }

  Color get palletColor {
    if (paletteGenerator?.paletteColors.isNotEmpty ?? false) {
      return paletteGenerator?.colors.first ?? Colors.black.withOpacity(.5);
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
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            getIt<PlaylistCubit>()..initializePlaylist(widget.playlist.id),
        child: BlocBuilder<PlaylistCubit, PlaylistState>(
          builder: (context, state) {
            if (state is PlaylistLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Scaffold(
              body: Stack(
                children: [
                  CustomSliverAppBar(
                    containerHeight: containerHeight,
                    palletColor: palletColor,
                    imageOpacity: imageOpacity,
                    imageSize: imageSize,
                    imageUrl: widget.playlist.imageUrl,
                  ),
                  SingleChildScrollView(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          height: 500,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(1),
                            ],
                          )),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: initialSize + 70),
                                MyText(
                                  widget.playlist.name,
                                  size: 25,
                                  fontWeight: FontWeight.w600,
                                  margin: const EdgeInsets.only(bottom: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: const Placeholder(
                                          fallbackHeight: 25,
                                          fallbackWidth: 25,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      // MyText(
                                      //   widget.album.artists[0],
                                      //   size: 16,
                                      //   fontWeight: FontWeight.w500,
                                      // )
                                    ],
                                  ),
                                ),
                                const MyText(
                                  'Playlist',
                                  size: 16,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.grey3,
                                  margin: EdgeInsets.only(bottom: 18),
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.favorite_border_outlined,
                                      color: CustomColors.grey3,
                                    ),
                                    SizedBox(width: 30),
                                    Vector(Vectors.download_icon),
                                    SizedBox(width: 30),
                                    Icon(
                                      Icons.more_horiz,
                                      color: CustomColors.grey3,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                (state as PlaylistLoaded).musics.length,
                                (index) => MusicTrack(
                                      music:
                                          (state).musics[index] as MusicModel,
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
                    title: widget.playlist.name,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
