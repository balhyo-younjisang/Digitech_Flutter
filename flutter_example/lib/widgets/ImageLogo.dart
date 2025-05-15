
import 'package:flutter/material.dart';

class ImageLogoWidget extends StatelessWidget {
  const ImageLogoWidget({super.key, required this.imagePath});

   final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Image(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    );
  }

}