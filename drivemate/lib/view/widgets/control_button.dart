import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ControlButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final Color? activeColor;
  final VoidCallback onTap;

  const ControlButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.grey, width: 1),
              color: isActive ? Colors.black : Colors.transparent,
            ),
            width: 70,
            height: 70,
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 40,
                height: 40,
                color: isActive ? (activeColor ?? Colors.white) : Colors.black,
              ),
            ),
          ),
        ),
        Text(label),
      ],
    );
  }
}
