import 'package:flutter/material.dart';

class MoreVerticalWidget extends StatelessWidget {
  const MoreVerticalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.redAccent,
            ),
          ),
        ),
        PopupMenuButton(
          icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
          itemBuilder:
              (context) => [
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("설정"),
                  ),
                ),
              ],
        ),
      ],
    );
  }
}
