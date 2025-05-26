import 'package:flutter/material.dart';

class RadiusBox extends DecoratedBox {
  RadiusBox({required BorderRadiusGeometry borderRadius, super.child})
    : super(decoration: BoxDecoration(borderRadius: borderRadius));

  RadiusBox.all(final double radius, {super.child})
    : super(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
      );
}

class WideBox extends SizedBox {
  const WideBox({super.key, super.child, super.height})
    : super(width: double.infinity);
}

class WideContainer extends Container {
  WideContainer({super.key, super.child, super.height, super.decoration})
    : super(width: double.infinity);
}
