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
}