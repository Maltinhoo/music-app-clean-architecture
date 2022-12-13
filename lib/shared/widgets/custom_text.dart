import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../enums/convertion_type_enum.dart';

class MyText extends StatelessWidget {
  // static TanslationCubit translationCubit = GetIt.I.get<TanslationCubit>();
  final TextStyle? textStyle;
  final String text;
  final FontWeight? fontWeight;
  final double? height;

  final double? size;
  final double minSize;
  final Color? color;
  final String? fontFamily;
  final Gradient? gradient;
  final TextDecoration? decoration;

  final List<Shadow>? shadows;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final FontStyle? fontStyle;

  final EdgeInsets? margin;
  final EdgeInsetsGeometry padding;
  final AutoSizeGroup? group;

  /// If the text is directioned based on its content or on the current app state - if `true` the widget will check the fist letter and determine its directionality
  final bool activeDirectionality;

  final bool autosize;

  final List<String>? arguments;
  final ConversionType? conversionType;

  const MyText(
    this.text, {
    this.margin,
    this.activeDirectionality = true,
    this.padding = const EdgeInsets.all(0),
    this.textStyle,
    Key? key,
    this.textAlign,
    this.fontWeight,
    this.minSize = 2,
    this.overflow,
    this.maxLines,
    this.size,
    this.color,
    this.shadows,
    this.gradient,
    this.autosize = true,
    this.group,
    this.fontFamily,
    this.decoration,
    this.height,
    this.fontStyle,
    this.arguments,
    this.conversionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(
        color == null || gradient == null, 'use either a gradient or a color');

    TextStyle? style;
    if (textStyle != null) {
      style = textStyle!;
    }

    style ??= Theme.of(context).textTheme.bodyText1!;

    style = style.copyWith(
        fontSize: size ?? style.fontSize,
        color: color ?? style.color,
        fontFamily: fontFamily ?? style.fontFamily,
        fontWeight: fontWeight ?? style.fontWeight,
        shadows: shadows ?? style.shadows,
        decoration: decoration ?? style.decoration,
        height: height ?? style.height,
        fontStyle: fontStyle ?? style.fontStyle);

    return Padding(
      padding: padding,
      child: Container(margin: margin, child: _buildText(style)),
    );
  }

  String get getText {
    return conversionType == ConversionType.toUpperCase
        ? text.toUpperCase()
        : conversionType == ConversionType.toLowerCase
            ? text.toLowerCase()
            : conversionType == ConversionType.capitalize
                ? text.capitalize()
                : text;
  }

  Widget _buildText(TextStyle? style) {
    var textWidget = autosize
        ? AutoSizeText(
            getText,
            textScaleFactor: globalTextScaleFactor,
            style: style,
            textAlign: textAlign,
            minFontSize: minSize,
            overflow: overflow,
            maxLines: maxLines ?? 10,
            group: group,
          )
        : Text(
            text,
            style: style,
            textAlign: textAlign,
            overflow: overflow,
            maxLines: maxLines ?? 10,
          );

    return gradient != null
        ? ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (rect) => gradient!.createShader(rect),
            child: textWidget,
          )
        : textWidget;
  }

  static double globalTextScaleFactor = .85;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
