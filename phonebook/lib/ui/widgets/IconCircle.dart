import 'package:flutter/material.dart';

class IconCircleWidget extends StatelessWidget {
  final LinearGradient? gradient;
  final IconData icon;
  final Color iconColor;
  final Color? backgroundColor;

  const IconCircleWidget({
    super.key,
    this.gradient,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
        color: backgroundColor,
      ),
      child: Icon(icon, color: iconColor),
    );
  }
}
