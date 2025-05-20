import 'package:flutter/material.dart';

class IconCircleWidget extends StatelessWidget {
  final LinearGradient? gradient;
  final IconData? icon;
  final Color? iconColor;

  const IconCircleWidget({
    super.key,
    this.gradient,
    required this.iconColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(shape: BoxShape.circle, gradient: gradient),
      child: Icon(icon, color: iconColor),
    );
  }
}
