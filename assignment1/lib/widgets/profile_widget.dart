import 'package:assignment1/utils/color_util.dart';
import 'package:flutter/material.dart';

class _PictureClipper extends CustomClipper<Path> {
  final Decoration decoration;

  const _PictureClipper(this.decoration);

  @override
  Path getClip(final Size size) {
    final Rect rect = Offset.zero & size;

    return this.decoration.getClipPath(rect, TextDirection.ltr);
  }

  @override
  bool shouldReclip(covariant final CustomClipper<Path> customClipper) {
    if (customClipper.runtimeType != _PictureClipper) {
      return false;
    }

    final _PictureClipper oldProfileClipper = customClipper as _PictureClipper;

    return oldProfileClipper.decoration != this.decoration;
  }
}

class ProfilePicture extends StatelessWidget {
  final Decoration decoration;
  final Color backgroundColor;

  ProfilePicture({
    required this.decoration,
    Color? backgroundColor
  }) : this.backgroundColor = backgroundColor ?? ColorUtil.randomWithRange(min: 126);

  ProfilePicture.circle(): this(
    decoration: BoxDecoration(
      shape: BoxShape.circle
    )
  );

  @override
  Widget build(final BuildContext context) {
    return ClipPath(
      clipBehavior: Clip.hardEdge,
      clipper: _PictureClipper(this.decoration),
      child: ColoredBox(
        color: this.backgroundColor,
        child: LayoutBuilder(builder: (final context, final constraints) {
          return SizedBox(
            height: double.infinity,
            width: constraints.maxHeight,
            child: Icon(Icons.people)
          );
        })
      )
    );
  }
}