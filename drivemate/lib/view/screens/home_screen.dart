import 'dart:async';

import 'package:drivemate/model/car.dart';
import 'package:drivemate/model/user.dart';
import 'package:drivemate/view/screens/login_screen.dart';
import 'package:drivemate/view/screens/status_screen.dart';
import 'package:drivemate/view/widgets/car_app_bar.dart';
import 'package:drivemate/view/widgets/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.car});

  final Car car;

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isPowerOn = false;
  bool isLock = false;
  bool isDoorOpen = false;
  bool isTailgateOpen = false;
  bool isHoodOpen = false;

  void setTailgate(bool value) {
    setState(() {
      isTailgateOpen = value;
    });
  }


  void setHood(bool value) {
    setState(() {
      isHoodOpen = value;
    });
  }

  void setPower(bool value) {
    setState(() {
      isPowerOn = value;
    });
  }

  void setLock(bool value) {
    setState(() {
      isLock = value;
    });
  }

  void setDoor(bool value) {
    setState(() {
      isDoorOpen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [HomeView(), Container(), StatusPage(car: widget.car), Container()],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withAlpha(200)),
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          width: size.width,
          height: 60,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: TabBar(
              indicator: UnderlineTabIndicator(),
              indicatorColor:  Color.fromRGBO(
                178,
                136,
                124,
                1,
              ),
              indicatorWeight: 1,
              labelColor:  Color.fromRGBO(
                178,
                136,
                124,
                1,
              ),
              unselectedLabelStyle: TextStyle(color: Colors.black),
              tabs: [
                Column(
                  children: [
                    Icon(
                      Icons.home_outlined,
                      color: Color.fromRGBO(178, 136, 124, 1),
                      size: 28,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Color.fromRGBO(178, 136, 124, 1),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Icon(
                      Icons.control_camera_outlined,
                      color: Colors.grey,
                      size: 28,
                    ),
                    Text(
                      "Control",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
                InkWell(

                  child: Column(
                    children: [
                      Icon(
                        Icons.directions_car_outlined,
                        color: Colors.grey,
                        size: 28,
                      ),
                      Text(
                        "Status",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/device_hub_black_24dp.svg",
                      width: 28,
                      color: Colors.grey,
                    ),
                    Text(
                      "Share",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
