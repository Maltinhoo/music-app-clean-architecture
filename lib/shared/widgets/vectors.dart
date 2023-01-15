// ignore_for_file: constant_identifier_names, duplicate_ignore

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Vectors {
  notification,
  recently_played,
  settings,
  home,
  search,
  library,
  download_icon,
  up_down_arrows,
}

class Vector extends StatelessWidget {
  final Vectors? vector;
  final String? rarity;
  final double? size;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final Alignment? alignment;
  final BlendMode? blendMode;
  const Vector(this.vector,
      {Key? key,
      this.size,
      this.blendMode,
      this.color,
      this.fit,
      this.width,
      this.height,
      this.alignment})
      : rarity = null,
        super(key: key);

  const Vector.fromRarity(this.rarity,
      {Key? key,
      this.size,
      this.blendMode,
      this.color,
      this.fit,
      this.width,
      this.height,
      this.alignment})
      : vector = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (vector == null && rarity == null) return Container();
    String fileName =
        describeEnum(vector ?? Vectors.notification).toLowerCase();
    String path = 'assets/vectors/$fileName.svg';
    return SvgPicture.asset(
      alignment: alignment ?? Alignment.center,
      path,
      fit: fit ?? BoxFit.cover,
      width: width ?? size,
      height: height ?? size,
      color: color ?? Colors.white,
      colorBlendMode: blendMode ?? BlendMode.srcIn,
    );
  }
}
