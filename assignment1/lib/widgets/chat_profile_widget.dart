import 'package:assignment1/utils/color_util.dart';
import 'package:flutter/material.dart';

class ChatProfile extends StatelessWidget {
  const ChatProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorUtil.randomWithRange(min: 126),
      ),
      width: 50,
      height: 50,
    );
  }
}