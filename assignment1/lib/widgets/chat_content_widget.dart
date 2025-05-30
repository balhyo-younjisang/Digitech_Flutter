import 'package:assignment1/views/live_chat.dart';
import 'package:flutter/material.dart';
import 'package:assignment1/widgets/chat_profile_widget.dart';
import 'package:intl/intl.dart';

class ChatContent extends StatelessWidget {
  final String sender;
  final String content;
  final DateTime timestamp;

  const ChatContent({
    super.key,
    required this.sender,
    required this.content,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final sendDateTime = DateFormat("yy년 MM월 dd일 HH시 mm분");

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          ChatProfile(),
          Expanded(child:
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    sender,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: size.height * 0.02,
                    ),
                  ),
                  Text(
                    sendDateTime.format(timestamp),
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: size.height * 0.015,
                    ),
                  ),
                ],
              ),
              Text(content, style: TextStyle(color: Colors.white)),
            ],
          ),
          )
        ],
      ),
    );
  }
}
