import 'package:flutter/material.dart';

import 'package:drivemate/view/screens/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "NotoSansKR"
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    ));
  }
}