import 'dart:convert';

abstract class Message {
  String get message;
  String get clientId;
  String get name;
}

class DefaultMessage implements Message {
  @override
  final String clientId;
  @override
  final String message;
  @override
  final String name;

  DefaultMessage({required this.message, required this.clientId, required this.name});
}

class SendMessage extends DefaultMessage {
  final String _topic;
  final int _qos;

  SendMessage({
    required super.clientId,
    required super.message,
    required String topic,
    required int qos,
    required super.name
}) :
  _topic = topic,
  _qos = qos;

  String get topic => _topic;
  int get qos => _qos;
  String get jsonSerialize => jsonEncode(jsonDeserialize);

  Map<String, dynamic> get jsonDeserialize => {
    'clientId': super.clientId,
    'name': super.name,
    'message': super.message,
    'topic': _topic,
    "qos": _qos
  };
}

class ReceiveMessage extends DefaultMessage {
  final DateTime _sendTimestamp;
  ReceiveMessage({
    required super.message,
    required super.clientId,
    required DateTime sendTimestamp,
    required super.name
  })
      : _sendTimestamp = sendTimestamp;

  DateTime get sendTimestamp => _sendTimestamp;

  static ReceiveMessage jsonDeserialize(final json) {
    var object = jsonDecode(json);

    return ReceiveMessage(message: object['message'], clientId: object['clientId'], sendTimestamp: DateTime.parse(object['sendDateTime']), name: object['name']);
  }
}