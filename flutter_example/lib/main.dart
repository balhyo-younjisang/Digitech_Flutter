import 'package:flutter/material.dart';
import 'package:flutter_example/page/counter1.dart';
import 'package:flutter_example/page/counter2.dart';
import 'package:flutter_example/page/navigate.dart';
import 'package:flutter_example/widgets/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          // child: CardWidget(height: 700, width: 450, headerFlex: 2, assetFlex: 6, contentFlex: 5),
          child: CardWidget(height: 500, width: 450, imagePath: "assets/images/ano.jpg",),
        )
      )
    );
  }
}
