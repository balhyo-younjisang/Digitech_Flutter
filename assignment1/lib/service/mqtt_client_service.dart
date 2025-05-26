import 'package:mqtt5_client/mqtt5_server_client.dart';

Future<MqttServerClient> connectMqttBroker() async {
  var client = MqttServerClient.withPort('10.56.148.130', 'yunjisang', 11883);

  // client.setProtocolV311();
  client.logging(on: true);
  await client.connect();

  return client;
}