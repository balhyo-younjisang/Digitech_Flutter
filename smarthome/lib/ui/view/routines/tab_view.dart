import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:smarthome/model/routine.dart';
import 'package:smarthome/model/switchable_content.dart';
import 'package:smarthome/ui/widget/common/custom_text_factory.dart';
import 'package:smarthome/ui/widget/common/switch_widget.dart';
import 'package:smarthome/ui/widget/common/text_widget.dart';

class RoutinesTab extends StatefulWidget {
  const RoutinesTab({super.key});

  @override
  State<StatefulWidget> createState() => RoutinesTabState();
}

class RoutinesTabState extends State<RoutinesTab> {
  static CustomTextFactory boldTextFactory = CustomTextProducer.getFactory(
    isBold: true,
  );
  static CustomTextFactory simpleCustomStyleText =
      CustomTextProducer.getFactory(isBold: false);

  final List<RoutineModel> routines = [
    RoutineModel(title: "Good Morning", clock: "AM 6:00", date: "Every day"),
    RoutineModel(title: "Good Morning", clock: "AM 6:00", date: "Every day"),
    RoutineModel(title: "Good Morning", clock: "AM 6:00", date: "Every day"),
    RoutineModel(title: "Good Morning", clock: "AM 6:00", date: "Every day"),
    RoutineModel(title: "Good Morning", clock: "AM 6:00", date: "Every day"),
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
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
                      SwitchableHeader header = SwitchableHeader<Text>(
                        BoldText.h3(currentRoutine.title),
                      );
                      SwitchableContent content = SwitchableContent<Column>(
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Symbols.calendar_month),
                                Text(currentRoutine.date),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Symbols.timer_rounded),
                                Text(currentRoutine.clock),
                              ],
                            ),
                          ],
                        ),
                      );

                      return SwitchBox(header: header, content: content);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
