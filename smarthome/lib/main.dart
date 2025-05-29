import 'package:flutter/material.dart';
import 'package:smarthome/ui/splash_screen.dart';
import 'package:smarthome/ui/view/layout_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Arial",
        scaffoldBackgroundColor: Color.fromRGBO(243, 244, 245, 1)
      ),
      // home: SplashScreen(),
      home: LayoutView(),
      debugShowCheckedModeBanner: false,
    );
  }
}