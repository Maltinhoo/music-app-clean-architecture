import 'package:flutter/material.dart';

class Bouncing extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool showNotImplementedIfOnTapIsNull;
  final HitTestBehavior? behavior;
  final bool? bounce;
  final bool showClickable;
  const Bouncing({
    required this.child,
    this.onLongPress,
    Key? key,
    this.onTap,
    this.showNotImplementedIfOnTapIsNull = true,
    this.behavior,
    this.bounce = true,
    this.showClickable = true,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BouncingState createState() => _BouncingState();
}

class _BouncingState extends State<Bouncing>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.bounce != null
        ? _scale = widget.bounce! ? 1 - _controller.value : 1
        : _scale = 1 - _controller.value;

    return GestureDetector(
      behavior: widget.behavior,
      onLongPress: widget.onLongPress,

      // onTapDown: (_) async {
      //   if (widget.onTap != null) {
      //     _controller.forward();
      //     await Future.delayed(Duration(milliseconds: 200));
      //     _controller.reverse();
      //   }
      // },
      onTap: () async {
        _controller.forward();
        await Future.delayed(const Duration(milliseconds: 100));

        if (widget.onTap != null) {
          widget.onTap!();
        }
        _controller.reverse();
      },

      child: MouseRegion(
        cursor: widget.showClickable
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        onEnter: (_) {
          _controller.forward();
        },
        onExit: (event) => _controller.reverse(),
        child: Transform.scale(
          scale: _scale,
          child: widget.child,
        ),
      ),
    );
  }
}
