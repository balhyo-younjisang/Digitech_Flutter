import 'package:assignment1/model/message.dart';
import 'package:assignment1/service/mqtt_client_service.dart';
import 'package:assignment1/widgets/chat_bottombar_widget.dart';
import 'package:assignment1/widgets/chat_content_widget.dart';
import 'package:assignment1/widgets/chat_header.dart';
import 'package:flutter/material.dart';
import 'package:mqtt5_client/mqtt5_client.dart';
import 'package:mqtt5_client/mqtt5_server_client.dart';

var clientId = 'client-sdh-yjs';
var name = "이정욱 비계";
final builder = MqttPayloadBuilder();
var publishTopic = 'chat/pub/sdh-3-4';
var subscribeTopic = 'chat/sub/sdh-3-4';

class LiveChat extends StatefulWidget {
  const LiveChat({super.key});

  @override
  State<StatefulWidget> createState() => LiveChatState();
}

class LiveChatState extends State<LiveChat> {
  late MqttServerClient client;
  List<ReceiveMessage> messages = [];
  final controller = ScrollController();
  FocusNode textFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    connectMqttBroker().then((client) {
      this.client = client;
      this.client.subscribe(subscribeTopic, MqttQos.atMostOnce);
      this.client.updates.listen((receives) {
        // final receive = event[0].payload as MqttPublishMessage;
        // final message = MqttUtilities.bytesToStringAsString(receive.payload.message!);
        //
        // setState(() {
        //   messages.add(message);
        //   print(message);
        // });
        // final messages =
        //     receives
        //         .where((receive) => receive.topic == "game/tile")
        //         .map((receive) => receive.payload as MqttPublishMessage)
        //         .map((receive) => ReceiveMessage(clientId: , name: , sendTimestamp: , message: MqttUtilities.bytesToStringAsString(receive.payload.message!)))
        //         .toList();
        final receive = receives.firstWhere((receive) => receive.topic == subscribeTopic).payload as MqttPublishMessage;
        final message = MqttUtilities.bytesToStringAsString(receive.payload.message!);
        final receiveMessage = ReceiveMessage.jsonDeserialize(message);
        // print(receiveMessage.message);

        setState(() {
          this.messages.insert(0, receiveMessage);
        });
      controller.animateTo(0, duration: Duration(milliseconds: 300) , curve: Curves.easeInOut);
      });
    });
  }

  void sendMessageHandler(String data) {
    // final payload= jsonEncode(data);
      final message = SendMessage(clientId: clientId, message: data, topic: publishTopic, qos: MqttQos.atMostOnce.index, name: name).jsonSerialize;
      builder.clear();
      builder.addUTF8String(message);
      this.client.publishMessage(publishTopic, MqttQos.atMostOnce, builder.payload!);
      //
      // builder.clear();
      // builder.addUTF8String(data);
      //
      // this.client.publishMessage(
      //   "game/tile",
      //   MqttQos.exactlyOnce,
      //   builder.payload!,
      // );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.client.unsubscribeStringTopic(subscribeTopic);
    this.client.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: () {
      this.textFocus.unfocus();
    }, child : Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white10,
      appBar: ChatHeader(),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              reverse:true,
              itemBuilder: (context, index) {
                return ChatContent(
                  sender: messages[index].name,
                  content: messages[index].message,
                  timestamp: messages[index].sendTimestamp,
                );
              },
              separatorBuilder:
                  (context, index) =>
                      Divider(color: Colors.white10, endIndent: 15, indent: 15),
              controller: controller,
              itemCount: messages.length,
            ),
          ),
          ChatBottomBar(sendMessageHandler: sendMessageHandler),
        ],
      ),
    ));
  }
}
