import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  const ChatHeader({super.key});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return PreferredSize(
      preferredSize: Size.fromHeight(size.height * 0.09),
      child: ColoredBox(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.black87,
              title: Row(
                spacing: 10,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu_rounded, color: Colors.white54),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "# ",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: "Digitech",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}