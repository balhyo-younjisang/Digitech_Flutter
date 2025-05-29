import 'package:flutter/material.dart';
import 'package:smarthome/ui/widget/common/switch_widget.dart';

class SwitchableContent {
  bool _isOn;
  final Widget _title;
  final List<Widget> _content;

  SwitchableContent({isOn = false, required title, required content})
   : _isOn = isOn,
    _title = title,
    _content = content;

  bool get isOn => _isOn;

  set isOn(bool value) {
    _isOn = value;
  }

  Widget get title => _title;
  List<Widget> get content => _content;
}

class DeviceContent extends SwitchableContent {
  DeviceContent({ bool super.isOn = false, required super.title, required List<Widget> super.content});
}

class RoutineContent extends SwitchableContent {
  RoutineContent({bool super.isOn = false, required  super.title, required List<Widget> super.content});
}