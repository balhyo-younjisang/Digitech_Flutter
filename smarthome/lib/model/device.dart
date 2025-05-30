import 'package:flutter/material.dart';

class DeviceModel {
  final Icon _icon;
  final String _name;
  final String _description;

  DeviceModel({
    required icon,
    required name,
    required description,
  }) : _icon = icon, _name = name, _description = description;

  String get description => _description;
  String get name => _name;
  Icon get icon => _icon;
}
