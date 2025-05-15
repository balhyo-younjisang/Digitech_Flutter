
import 'package:flutter/material.dart';

class ProfileCircle extends StatelessWidget {
  const ProfileCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black26, width: 1),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image(
        image: AssetImage("assets/images/ano_profile.webp"),
        fit: BoxFit.cover,
      ),
    );
  }
}