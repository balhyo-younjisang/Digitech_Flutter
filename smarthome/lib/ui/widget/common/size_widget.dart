import 'package:flutter/material.dart';

class FullWidthBox extends SizedBox {
  const FullWidthBox({super.key, super.child, super.height})
    : super(width: double.infinity);
}

class FullHeightBox extends SizedBox {
  const FullHeightBox({super.key, super.child, super.width})
    : super(height:double.infinity);
}

class FullSizeBox extends SizedBox {
  const FullSizeBox({super.key, super.child})
    : super(width:  double.infinity, height: double.infinity);
}