import 'package:flutter/material.dart';
import 'package:phonebook/ui/widgets/IconCircle.dart';

class IconButtonWidget extends IconCircleWidget {
  final Color backgroundColor;
  final double width;
  final double height;

  const IconButtonWidget({
    super.key,
    required super.iconColor,
    required super.icon,
    required this.backgroundColor,
  }) : width = 40,
       height = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
        color: backgroundColor,
      ),
      child: Icon(icon, color: iconColor),
    );
  }
}
