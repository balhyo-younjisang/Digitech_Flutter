import 'package:mqtt5_client/mqtt5_server_client.dart';

Future<MqttServerClient> connectMqttBroker() async {
  var client = MqttServerClient.withPort('10.56.148.130', 'yunjisang', 11883);

  // client.setProtocolV311();
  client.logging(on: true);
  client.onConnected = () => print("[MQTT Client] Connected successful");
  client.onSubscribed = (subscription) => print("[MQTT Client] on subscribe ${subscription.topic}");
  client.onDisconnected = () => print("[MQTT Client] Disconnected successful");
  await client.connect("sdh-flutter", "1234");

  return client;
}