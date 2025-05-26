import 'package:assignment1/widgets/box_widget.dart';
import 'package:assignment1/widgets/chat_icon_widget.dart';
import 'package:flutter/material.dart';

class ChatBottomBar extends StatefulWidget {
  final void Function(String data) sendMessageHandler;
  const ChatBottomBar({super.key, required this.sendMessageHandler});

  @override
  State<StatefulWidget> createState() => ChatBottomBarState();
}

class ChatBottomBarState extends State<ChatBottomBar> {
    late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final typingInputDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white10,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(80)),
      ),
      hintText: "#Digitech에 메시지",
    );

    return WideContainer(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      height: size.height * 0.085,
      child: Row(
        children: [
          ChatIconButton(callback: () {
          }, icon: Icons.add_circle_rounded),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: controller,
                decoration: typingInputDecoration,
                style: TextStyle(color: Colors.white),
                expands: true,
                maxLines: null,
                minLines: null,
              ),
            ),
          ),
          ChatIconButton(callback: () {widget.sendMessageHandler(controller.text);}, icon: Icons.send_rounded),
          ChatIconButton(callback: () {}, icon: Icons.emoji_emotions_rounded),
        ],
      ),
    );
  }
}
