import 'package:flutter/material.dart';
import 'package:phonebook/ui/pages/keypad.dart';
import 'package:phonebook/ui/pages/phonebook.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Phonebook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DefaultTabController(
        initialIndex: 2,
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: TabBarView(
            children: [KeypadScreen(), Container(), PhoneBookScreen()],
          ),
          bottomNavigationBar: TabBar(
            dividerHeight: 0,
            unselectedLabelStyle: TextStyle(color: Colors.white30),
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicator: UnderlineTabIndicator(
              insets: EdgeInsets.symmetric(vertical: 10),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            tabs: [
              Tab(child: Text("키패드")),
              Tab(child: Text("최근 기록")),
              Tab(child: Text("연락처")),
            ],
          ),
        ),
      ),
    );
  }
}
