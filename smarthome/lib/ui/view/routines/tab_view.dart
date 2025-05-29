import 'package:flutter/material.dart';
import 'package:smarthome/model/switchable_content.dart';
import 'package:smarthome/ui/widget/common/switch_widget.dart';
import 'package:smarthome/ui/widget/common/title_widget.dart';

class RoutinesTab extends StatefulWidget {
  const RoutinesTab({super.key});

  @override
  State<StatefulWidget> createState() => RoutinesTabState();
}

class RoutinesTabState extends State<RoutinesTab> {
  final List<RoutineContent> routines = [
    RoutineContent(title: Text("Good Morning"), content: []),
    RoutineContent(title: Text("Good Morning"), content: []),
    RoutineContent(title: Text("Good Morning"), content: []),
    RoutineContent(title: Text("Good Morning"), content: []),
    RoutineContent(title: Text("Good Morning"), content: []),
    RoutineContent(title: Text("Good Morning"), content: []),
    RoutineContent(title: Text("Good Morning"), content: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(
              pageTitle: "Routines",
              pageDescription: "Set a routine and live a smart life",
            ),
            SingleChildScrollView(
              child: GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 5 / 6,
                ),
                children: [
                  ...List.generate(routines.length, (index) {
                    var currentRoutine = routines[index];
                    return SwitchBox(switchableContent: currentRoutine);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
