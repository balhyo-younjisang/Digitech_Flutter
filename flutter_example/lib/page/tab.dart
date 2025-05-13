import 'package:flutter/material.dart';
import 'package:flutter_example/page/counter1.dart';
import 'package:flutter_example/page/counter2.dart';

class MyTab extends StatelessWidget {
  const MyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              child: Text('Counter'),
            ),
            Tab(
              child: Text('Counter2'),
            )
          ]),
        ),
        body: TabBarView(children: [Counter1Page(), CounterWidget()]),
      ),
    );
  }
}