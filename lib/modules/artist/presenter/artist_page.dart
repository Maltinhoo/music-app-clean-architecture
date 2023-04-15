import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/modules/artist/domain/entities/artist_entity.dart';
import 'package:palette_generator/palette_generator.dart';

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
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                    palletColor.withOpacity(1),
                    palletColor.withOpacity(.05),
                    palletColor.withOpacity(0),
                  ],
                ),
              ),
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: imageOpacity.clamp(0.0, 1.0),
                    duration: const Duration(milliseconds: 500),
                    child: CachedNetworkImage(
                      imageUrl: widget.artist.imageUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            const Placeholder(
              fallbackHeight: 500,
            )
          ],
        ),
      )),
    );
  }
}
