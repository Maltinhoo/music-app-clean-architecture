import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/modules/album/infra/models/album_model.dart';
import 'package:music_app/shared/widgets/custom_text.dart';
import 'package:music_app/shared/widgets/vectors.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../shared/utils/custom_colors.dart';
import '../../../shared/widgets/custom_sliver.dart';
import '../../../shared/widgets/play_app_bar.dart';

class AlbumPage extends StatefulWidget {
  static const routeName = '/album';

  final AlbumModel album;
  const AlbumPage({super.key, required this.album});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
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
      CachedNetworkImageProvider(widget.album.albumArtUrl),
    );

    super.initState();
  }

  Future<void> _updatePaletteGenerator(ImageProvider image) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      image,
      maximumColorCount: 3,
    );
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
      child: Scaffold(
        body: Stack(
          children: [
            CustomSliverAppBar(
              containerHeight: containerHeight,
              palletColor: palletColor,
              imageOpacity: imageOpacity,
              imageSize: imageSize,
              imageUrl: widget.album.albumArtUrl,
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
                            widget.album.title,
                            size: 25,
                            fontWeight: FontWeight.w600,
                            margin: const EdgeInsets.only(bottom: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
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
                          MyText(
                            widget.album.songs.length > 1 ? 'Album' : 'Single',
                            size: 16,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.grey3,
                            margin: const EdgeInsets.only(bottom: 18),
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
                  // TODO: add songs
                  SizedBox(
                    width: width,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            20,
                            (index) => Container(
                                  height: 41,
                                  width: 40,
                                  color: Colors.red,
                                )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            PlayAppBar(
              showTopBar: showTopBar,
              palletColor: palletColor,
              containerHeight: containerHeight,
              title: widget.album.title,
            )
          ],
        ),
      ),
    );
  }
}
