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
}
