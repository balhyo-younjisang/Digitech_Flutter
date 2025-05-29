import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:smarthome/model/switchable_content.dart';
import 'package:smarthome/ui/widget/common/switch_widget.dart';

class RoomTabContent extends StatefulWidget {
  final TabController tabController;
  const RoomTabContent({super.key, required this.tabController});

  @override
  State<StatefulWidget> createState() => RoomTabContentState();
}

class RoomTabContentState extends State<RoomTabContent> {
  List<DeviceContent> devices = [
    DeviceContent(
      title: Icon(Symbols.mic,),
      content: [Text("Smart Mic"), Text("40%")],
    ),
    DeviceContent(
      title: Icon(Symbols.home_speaker_rounded),
      content: [Text("Smart Speaker"), Text("40%")],
    ),
    DeviceContent(
        title: Icon(Symbols.floor_lamp_rounded),
        content: [Text("Smart Lamp"), Text("4 Red light")],
    ),
    DeviceContent(
        title: Icon( Symbols.router_rounded),
        content: <Widget>[Text("Wifi Router"), Text("100 Mbps")],
    )
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
                    Text("Devices", style: TextStyle(fontSize: 20)),
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
                    childAspectRatio: 5 / 6
                  ),
                  children: [
                    ...List.generate(devices.length, (index) {
                      var currentDevice = devices[index];
                      return SwitchBox(switchableContent: currentDevice, /*changeOnOffHandler:changeOnOffHandler, index :index*/);
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
