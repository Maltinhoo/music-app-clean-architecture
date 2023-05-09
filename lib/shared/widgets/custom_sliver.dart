import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final double containerHeight;
  final Color palletColor;
  final double imageOpacity;
  final double imageSize;
  final String imageUrl;
  const CustomSliverAppBar({
    super.key,
    required this.containerHeight,
    required this.palletColor,
    required this.imageOpacity,
    required this.imageSize,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      color: palletColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: imageOpacity.clamp(0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.5),
                    offset: const Offset(0, 20),
                    blurRadius: 32,
                    spreadRadius: 10,
                  )
                ],
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
