import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_example/page/counter1.dart';
import 'package:flutter_example/page/counter2.dart';
import 'package:flutter_example/page/navigate.dart';
import 'package:flutter_example/page/parent.dart';
import 'package:flutter_example/page/tile.dart';
import 'package:flutter_example/widgets/card.dart';
import 'package:flutter_example/widgets/profile1.dart';
import 'package:flutter_example/widgets/profile2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const List<Widget> profiles = [Profile1Widget(), Profile2Widget()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Ubuntu"
      ),
      home: Scaffold(
        appBar: AppBar(),
        body:
        // child: CardWidget(height: 700, width: 450, headerFlex: 2, assetFlex: 6, contentFlex: 5),
        // child: CardWidget(height: 450, width: 300, imagePath: "assets/images/ano.jpg", profilePath: 'assets/images/ano_profile.webp',),
        // Flexible(
        //   child: CardSwiper(
        //     cardBuilder:
        //         (context, index, percentThresholdX, percentThresholdY) =>
        //             profiles[index],
        //     cardsCount: profiles.length,
        //   ),
        // ),
        // TileWidget()
        ParentWidget()
      ),
    );
  }
}
