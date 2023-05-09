import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_app/modules/playlist/infra/models/playlist_model.dart';
import 'package:music_app/shared/widgets/bounce_widget.dart';

import '../../modules/playlist/presenter/playlist_page.dart';
import 'custom_text.dart';

class PlaylistCard extends StatelessWidget {
  final PlaylistModel playlist;
  const PlaylistCard({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onTap: () => Navigator.pushNamed(
        context,
        PlaylistPage.routeName,
        arguments: {'playlist': playlist},
      ),
      child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width * .45,
          decoration: BoxDecoration(
              color: const Color(0xff414141),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
                child: CachedNetworkImage(
                  imageUrl: playlist.imageUrl,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MyText(
                  playlist.name,
                  fontWeight: FontWeight.w600,
                  size: 20,
                ),
              )
            ],
          )),
    );
  }
}
