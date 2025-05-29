import 'package:flutter/material.dart';
import 'package:smarthome/constants/color.dart';
import 'package:smarthome/model/switchable_content.dart';

class SwitchBox extends StatefulWidget {
  const SwitchBox({super.key, required this.switchableContent});

  final SwitchableContent switchableContent;

  @override
  State<StatefulWidget> createState() => SwitchBoxState();
}

class SwitchBoxState extends State<SwitchBox> {
  @override
  Widget build(BuildContext context) {
    return Material(
      textStyle: TextStyle(
        color: widget.switchableContent.isOn ? inactiveColor : activeColor,
      ),
      color: widget.switchableContent.isOn ? activeColor : inactiveColor,
      type: MaterialType.card,
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: SizedBox(
        height: 174,
        width: 174,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.switchableContent.title,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.switchableContent.content,
                  ),
                ],
              ),
              Switch(
                activeTrackColor: activeSwitchColor,
                inactiveTrackColor: inactiveSwitchColor,
                value: widget.switchableContent.isOn,
                onChanged: (bool value) {
                  setState(() {
                    widget.switchableContent.isOn = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
