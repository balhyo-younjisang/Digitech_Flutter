import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:phonebook/domain/phone.dart';

class ColorUtil {
  static Color buildPrefixColor(PhoneStatus? status) {
    if(status != null) {
      return switch(status) {
        PhoneStatus.outboundCall => Colors.green,
        PhoneStatus.receivedCall =>Colors.greenAccent,
        PhoneStatus.missingCall => Colors.redAccent,
        PhoneStatus.profile => Colors.cyanAccent
      };
    }
    return Colors.cyanAccent;
  }


  static Color buildIconColorByCallType(CallType? callType) {
    if(callType != null) {
      return switch(callType) {
        CallType.incoming => Colors.green,
        CallType.outgoing => Colors.greenAccent,
        CallType.missed => Colors.redAccent,
        CallType.voiceMail => Colors.blueAccent,
        CallType.rejected => Colors.red,
        CallType.blocked => Colors.deepOrange,
        CallType.answeredExternally => Colors.amberAccent,
        CallType.unknown => Colors.blueGrey,
        CallType.wifiIncoming => throw UnimplementedError(),
        CallType.wifiOutgoing => throw UnimplementedError(),
      };
    }
    return Colors.redAccent;
  }
}