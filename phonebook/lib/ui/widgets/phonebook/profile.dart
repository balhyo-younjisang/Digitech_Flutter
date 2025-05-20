import 'package:flutter/material.dart';
import 'package:phonebook/domain/phone.dart';
import 'package:phonebook/ui/widgets/IconCircle.dart';

class ProfileWidget extends StatelessWidget {
  final PhoneStatus status;
  final LinearGradient? gradient;

  const ProfileWidget({super.key, required this.status, this.gradient});

  @override
  Widget build(BuildContext context) {
    return IconCircleWidget(
      icon: null,
      gradient: gradient,
      iconColor: Colors.cyanAccent
    );
  }
}
