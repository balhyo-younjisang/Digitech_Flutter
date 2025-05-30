import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:smarthome/model/device.dart';
import 'package:smarthome/ui/widget/common/custom_text_factory.dart';

class RoomTabContent extends StatefulWidget {
  final TabController tabController;
  const RoomTabContent({super.key, required this.tabController});

  @override
  State<StatefulWidget> createState() => RoomTabContentState();
}

class RoomTabContentState extends State<RoomTabContent> {
  static CustomTextFactory simpleCustomTextFactory = CustomTextProducer.getFactory(
    isBold: false,
  );

  @override
  void initState() {
    super.initState();
  }

  List<DeviceModel> devices = [
    DeviceModel(icon: Icon(Symbols.mic, size: 36), name: "Smart Mic", description: "40%"),
    DeviceModel(icon: Icon(Symbols.home_speaker_rounded, size: 36), name: "Smart Speaker", description: "40%"),
    DeviceModel(icon: Icon(Symbols.floor_lamp_rounded, size: 36), name: "Smart Lamp", description: "4 Red light"),
    DeviceModel(icon: Icon(Symbols.router_rounded, size: 36), name: "Wifi Router", description: "100 Mbps"),
    DeviceModel(icon: Icon(Symbols.router_rounded, size: 36), name: "Wifi Router", description: "100 Mbps"),
    DeviceModel(icon: Icon(Symbols.router_rounded, size: 36), name: "Wifi Router", description: "100 Mbps"),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.05,
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SimpleCustomStyleText.h2("Devices"),
                    Icon(Symbols.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: size.height * 0.5,
            child: TabBarView(
              controller: widget.tabController,
              children: [
                GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 5 / 6,
                  ),
                  children: [
                    ...List.generate(devices.length, (index) {
                      var currentDevice = devices[index];
                      // return SwitchBox(switchableContent: currentDevice);
                      return Container();
                    }),
                  ],
                ),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
