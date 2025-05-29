import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:smarthome/model/room_tab.dart';
import 'package:smarthome/ui/widget/home/room_tab_content.dart';
import 'package:smarthome/ui/widget/home/room_tab_header.dart';
import 'package:smarthome/ui/widget/common/title_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<StatefulWidget> createState() => HomeTabState();
}

class HomeTabState extends State<HomeTab> with TickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final TabController tabController;
  int selectedIndex = 0;

  final List<RoomTabModel> tabList = [
    RoomTabModel(tabText: "Living Room", icon: Symbols.scene_sharp),
    RoomTabModel(tabText: "Dining Room", icon: Icons.countertops_outlined),
    RoomTabModel(tabText: "Bed Room", icon: Icons.bed_outlined),
    RoomTabModel(tabText: "Bath Room", icon: Icons.bathtub_outlined),
    RoomTabModel(tabText: "Living Room", icon: Symbols.scene_sharp),
    RoomTabModel(tabText: "Dining Room", icon: Icons.countertops_outlined),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    tabController = TabController(length: tabList.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    _scrollController.dispose();
  }

  void clickTabHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(
              pageTitle: "Hi Jongwon",
              pageDescription: "Welcome to your smart Home",
            ),
            SizedBox(height: 20),
            DefaultTabController(
              initialIndex: 0,
              length: tabList.length,
              child: Column(
                  children: [
                    RoomTabHeader(
                      clickTabHandler: clickTabHandler,
                      tabController: tabController,
                      tabList: tabList,
                    ),
                    RoomTabContent(tabController: tabController),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
