import 'package:flutter/material.dart';
import 'package:smarthome/model/room_tab.dart';
import 'package:smarthome/ui/widget/home/room_tab_nav.dart';

class RoomTabHeader extends StatelessWidget {
  const RoomTabHeader({super.key, required this.clickTabHandler, required this.tabController, required this.tabList});

  final Function(int) clickTabHandler;
  final TabController tabController;
  final List<RoomTabModel> tabList;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(height: size.height * 0.15, child: TabBar(
      onTap: clickTabHandler,
      labelPadding: EdgeInsets.all(10),
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      controller: tabController,
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(color: Colors.transparent),
      tabs: <RoomTabNavWidget>[
        ...List.generate(tabList.length, (index) {
          return RoomTabNavWidget(
            tabText: tabList[index].tabText,
            icon: tabList[index].icon,
            index: index,
          );
        }),
      ],
    ));
  }
}