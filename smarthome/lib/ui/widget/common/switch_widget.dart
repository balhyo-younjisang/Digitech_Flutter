import 'package:flutter/material.dart';
import 'package:smarthome/constants/color.dart';
import 'package:smarthome/model/switchable_content.dart';

class SwitchBox extends StatefulWidget {
  final SwitchableHeader header;
  final SwitchableContent content;
  final bool initialValue;
  final SwitchSetting headerSetting;
  final SwitchSetting contentSetting;
  var _switchTitleProvider = SwitchTitleProvider();

  SwitchBox({
    super.key,
    required this.header,
    required this.content,
    required this.headerSetting,
    required this.contentSetting,
    this.initialValue = false,
  }) {
    _switchTitleProvider.register(SwitchTitleType.HEADER_ICON, SwitchHeaderIconTitle());
  }

  @override
  State<SwitchBox> createState() => _SwitchBoxState();
}

class _SwitchBoxState extends State<SwitchBox> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.initialValue;
  }

  void _toggle(bool value) {
    setState(() {
      isActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final switchProvider = widget._switchTitleProvider;

    return Material(
      color: isActive ? activeColor : inactiveColor,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 174,
        width: 174,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              switchProvider.findSwitchTitle(
                widget.content.widget.runtimeType
              )!.widget(widget.headerSetting),
              // widget.header.build(isActive),
              // widget.content.build(isActive),
              Switch(
                value: isActive,
                onChanged: _toggle,
                activeTrackColor: activeSwitchColor,
                inactiveTrackColor: inactiveSwitchColor,
                activeColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
// Widget _buildTitleWithColor(Widget title, isOn, Color color) {
//   if (title is Icon) {
//     return Icon(title.icon, color: color, size: title.size);
//   } else if (title is BoldText) {
//     return BoldText.toText(
//       title.data ?? '',
//       size: title.size,
//       color: isOn ? color : title.color,,
//     );
//   } else if (title is SimpleCustomStyleText) {
//     return SimpleCustomStyleText.toText(
//       title.data ?? '',
//       size: title.size,
//       color: isOn ? color : title.color,
//     );
//   }
//   return title;
// }

// List<Widget> _buildContentWithColor(
//   List<Widget> widgets,
//   bool isOn,
//   Color color,
// ) {
//   return widgets.map((widget) {
//     if (widget is Icon) {
//       return Icon(widget.icon, color: isOn ? Colors.white : color, size: 12);
//     } else if (widget is SimpleCustomStyleText) {
//       return SimpleCustomStyleText.toText(
//         widget.data ?? '',
//         size: widget.size,
//         color: isOn ? Colors.white : color,
//       );
//     } else if (widget is BoldText) {
//       return BoldText.toText(
//         widget.data ?? '',
//         size: widget.size,
//         color: isOn ? Colors.white : color,
//       );
//     }
//     return widget;
//   }).toList();
// }

// class SwitchBoxHeaderIconContent extends SwitchableContent<IconData> {
//   SwitchBoxHeaderIconContent({required super.header, required super.content});
//
//
// }

// class SwitchHeaderIconContent extends SwitchableContent {
//   IconData iconData;
//   bool isOn;
//   Color iconColor;
//
//   SwitchHeaderIconContent(this.iconData, this.isOn, this.iconColor)
//       : super(title: iconData, isOn: isOn, content: null);
// }
//
// abstract class SwitchHeader<T extends SwitchableContent> {
//   Widget headerWidget(T content);
// }
//
//
// class SwitchHeaderIcon implements SwitchHeader<DeviceContent> {
//   @override
//   Widget headerWidget(final DeviceContent content) {
//     final Icon icon = content.title as Icon;
//
//     return Icon(icon.icon, color: content.isOn ? Colors.white : content., size: 12);
//   }
//
// }
