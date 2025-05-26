import 'package:flutter/material.dart';

class ChatIconButton extends StatelessWidget {
  final VoidCallback callback;
  final IconData icon;
  final Color iconColor;

  const ChatIconButton({super.key, required this.callback, required this.icon, this.iconColor = Colors.white54});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: callback, icon: Icon(icon, color: iconColor));
  }
}