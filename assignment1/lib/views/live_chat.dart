import 'dart:convert';

import 'package:assignment1/service/mqtt_client_service.dart';
import 'package:assignment1/widgets/chat_bottombar_widget.dart';
import 'package:assignment1/widgets/chat_content_widget.dart';
import 'package:assignment1/widgets/chat_header.dart';
import 'package:flutter/material.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';

class LiveChat extends StatefulWidget {
  const LiveChat({super.key});

  @override
  State<StatefulWidget> createState() => _LiveChatState();
}

class _LiveChatState extends State<LiveChat> {
  late MqttServerClient client;
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    connectMqttBroker().then((client) {
      this.client = client;
      this.client.subscribe("game/tile", MqttQos.atMostOnce);
      this.client.updates.listen((event) {
        final receive = event[0].payload as MqttPublishMessage;
        final message = MqttUtilities.bytesToStringAsString(receive.payload.message!);

        setState(() {
          messages.add(message);
          print(message);
        });
      });
    });
  }

  void sendMessageHandler(String data) {
    // final payload= jsonEncode(data);
    final builder = MqttPayloadBuilder();
    builder.addString(data);

    this.client.publishMessage("game/tile", MqttQos.exactlyOnce, builder.payload!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white10,
      appBar: ChatHeader(),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ChatContent(sender: '$index번째 이은상', content: '$index번째 앙쌍!', timestamp: '2025.05.26 13:00');
              },
              separatorBuilder:
                  (context, index) =>
                      Divider(color: Colors.white10, endIndent: 15, indent: 15),
              itemCount: 5,
            ),
          ),
          ChatBottomBar(sendMessageHandler: sendMessageHandler,),
        ],
      ),
    );
  }
}
