import 'package:assignment1/types/global.dart';
import 'package:assignment1/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class BottomTab extends StatelessWidget {
  final Tabs _tabs;
  final Widgets _tabViews;

  const BottomTab({
    super.key,
    required Tabs tabs,
    required Widgets widgets
  }) :
    assert(tabs.length > 0 && widgets.length > 0),
    assert(tabs.length == widgets.length),
    this._tabs = tabs,
    this._tabViews = widgets;

  @override
  Widget build(final BuildContext context) {
    final Color borderColor = Theme.of(context).indicatorColor;
    final double height = MediaQuery.sizeOf(context).height;

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              children: this._tabViews
            ),
          ),
          WideBox(
            height: height * 0.065,
            child: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: borderColor,
                  width: 2.5
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              indicatorPadding: EdgeInsets.only(
                bottom: 12.5
              ),
              tabs: this._tabs
            )
          )
        ]
      )
    );
  }
}