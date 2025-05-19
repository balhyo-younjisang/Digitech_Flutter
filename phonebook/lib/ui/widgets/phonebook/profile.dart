import 'package:flutter/material.dart';
import 'package:phonebook/ui/widgets/IconCircle.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconCircleWidget(
      icon: Icons.person_rounded,
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.blueAccent, Colors.lightBlueAccent],
      ),
      iconColor: Colors.cyanAccent,
      backgroundColor: null,
    );
  }
}
