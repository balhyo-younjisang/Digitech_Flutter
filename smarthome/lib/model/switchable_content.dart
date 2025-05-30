import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// class SwitchableContent {
//   bool _isOn;
//   final Widget _title;
//   final List<Widget> _content;
//
//   SwitchableContent({isOn = false, required title, required content})
//    : _isOn = isOn,
//     _title = title,
//     _content = content;
//
//   bool get isOn => _isOn;
//
//   set isOn(bool value) {
//     _isOn = value;
//   }
//
//   Widget get title => _title;
//   List<Widget> get content => _content;
// }

abstract class Switchable {
  Widget widget;
  Color? activeColor;

  Switchable(this.widget);
}

class SwitchableWidgetsAdapter<T extends Switchable, E extends Switchable> with ChangeNotifier {
  final T header;
  final E content;
  bool _isActive = false;

  SwitchableWidgetsAdapter({required this.header, required this.content});

  void update(bool value) {
    _isActive = value;
    notifyListeners();
  }

  bool get isActive => _isActive;
}

class SwitchableHeader<T extends Text> extends Switchable {
  SwitchableHeader(T super.widget);
}

class SwitchableContent<T extends Widget> extends Switchable {
  SwitchableContent(T super.widget);
}

class SwitchableBoxWidget {
  final SwitchableHeader header;
  final SwitchableContent content;
  late final SwitchableWidgetsAdapter adapter;

  SwitchableBoxWidget({required this.header, required this.content}) : adapter = SwitchableWidgetsAdapter(header:header, content:content);
}

abstract class SwitchSetting {
  Color get color;
  double get size;
}

abstract class SwitchTitle<T extends SwitchSetting> {
  Widget widget(T setting);
}

class BasicSwitchSetting implements SwitchSetting {
  final Color color;
  final double size;

  const BasicSwitchSetting({
    required this.color,
    required this.size
  });
}

class IconSwitchSetting extends BasicSwitchSetting {
  final IconData iconData;

  const IconSwitchSetting({
    required this.iconData,
    required super.color,
    required super.size
  });
}

class TextSwitchSetting extends BasicSwitchSetting {
  final Text textData;

  TextSwitchSetting({
    required this.textData,
    required super.color,
    required super.size
  });
}

class SwitchHeaderIconTitle implements SwitchTitle<IconSwitchSetting> {
  @override
  Widget widget(IconSwitchSetting setting) {
    return Icon(
        setting.iconData,
        color: setting.color,
        size: setting.size
    );
  }
}

class SwitchTitleProvider {
  static final _instance = SwitchTitleProvider._privateConstructor();

  SwitchTitleProvider._privateConstructor();

  factory SwitchTitleProvider() {
    return _instance;
  }

  final Map<SwitchTitleType, SwitchTitle<dynamic>> _switchTitleStorage = {};

  void register<T extends SwitchSetting>(final SwitchTitleType type, final SwitchTitle<T> switchTitle) {
    this._switchTitleStorage.putIfAbsent(type, () => switchTitle);
  }

  SwitchTitle<T>? findSwitchTitle<T extends SwitchSetting>(final Type type) {
    return this._switchTitleStorage[type] as SwitchTitle<T>?;
  }
}

enum SwitchTitleType {

  HEADER_ICON,

  HEADER_BOLD_TEXT,

  HEADER_SIMPLE_TEXT,

  BODY_ICON,

  BODY_BOLD_TEXT,

  BODY_SIMPLE_TEXT

}

// class DeviceSwitchBoxContent extends SwitchableContent {
//   DeviceSwitchBoxContent({required Icon super.header, required super.content});
// }
//
// class RoutineSwitchBoxContent extends SwitchableContent {
//   RoutineSwitchBoxContent({required super.header, required super.content});
// }

// class DeviceContent extends SwitchableContent {
//   DeviceContent({ bool super.isOn = false, required Icon super.title, required super.content});
// }
//
// class RoutineContent extends SwitchableContent {
//   RoutineContent({bool super.isOn = false, required super.title, required super.content});
// }
