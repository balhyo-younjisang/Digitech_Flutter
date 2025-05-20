import 'package:flutter/material.dart';

enum PhoneStatus {
  outboundCall, receivedCall, missingCall, profile
}

class PhoneDummy {
  final UniqueKey key;
  final String phone;
  final String name;
  bool isExpanded;
  // final IconData icons;
  final PhoneStatus phoneStatus;

  PhoneDummy(this.key, {required this.name, required this.phone, required this.isExpanded, required this.phoneStatus});
}