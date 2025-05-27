import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:phonebook/domain/phone.dart';

class IconUtil {
  static IconData buildPrefix(PhoneStatus? status) {
    if (status != null) {
      return switch (status) {
        PhoneStatus.profile => Icons.person_rounded,
        PhoneStatus.outboundCall => Icons.phone_forwarded_outlined,
        PhoneStatus.receivedCall => Icons.phone_callback_outlined,
        PhoneStatus.missingCall => Icons.phone_missed,
      };
    }
    return Icons.error;
  }

  static IconData buildIconByCallType(CallType? callType) {
    if(callType != null) {
      return switch(callType) {
        CallType.incoming => Icons.phone_callback,
        CallType.outgoing => Icons.phone_forwarded,
        CallType.missed => Icons.phone_missed,
        CallType.voiceMail => Icons.voice_chat,
        CallType.rejected => Icons.phone_disabled,
        CallType.blocked => Icons.block,
        CallType.answeredExternally => Icons.phone_in_talk,
        CallType.unknown => Icons.person_remove,
        CallType.wifiIncoming => throw UnimplementedError(),
        CallType.wifiOutgoing => throw UnimplementedError(),
      };
    }
    return Icons.error;
  }
}
