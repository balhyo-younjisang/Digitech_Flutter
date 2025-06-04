import 'dart:async';

import 'package:drivemate/model/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.car});

  final Car car;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cloudImage2 = "assets/images/cloud2.png";
  bool isPowerOn = false;
  bool isLock = false;
  bool isDoorOpen = false;
  bool isWarning = false;
  late Timer timer;
  late Color warningColor = Colors.red;

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

  void setWarning(bool value) {
    setState(() {
      isWarning = value;
    });

    if (isWarning) {
      int isStart = 0;
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        isStart++;
        setState(() {
          warningColor = isStart % 2 == 0 ? Colors.red : Colors.white;
        });
      });
    } else {
      timer.cancel();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueGrey, Colors.white],
          ),
        ),
        child: Stack(
          children: [
            Image.asset(_cloudImage2, width: size.width * 1.2),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.car.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.chevron_right, color: Colors.black),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          SizedBox(
                            width: 40,
                            height: 30,
                            child: Stack(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.notifications_none_outlined,
                                    size: 28,
                                    color: Colors.black,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    width: 12,
                                    height: 12,
                                    child: Center(
                                      child: Text(
                                        "N",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings_outlined,
                                size: 28,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Row(
                            spacing: 5,
                            children: [
                              Icon(Icons.wb_sunny_outlined, size: 20),
                              Text("28.1°C", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Icon(Icons.my_location, size: 20),
                              Text("경상북도 경주시", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Icon(Icons.local_gas_station, size: 20),
                          Text("424km", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Image.asset(widget.car.imageLink),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setPower(!isPowerOn);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                color: isPowerOn
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                              width: 70,
                              height: 70,
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/power_settings_new_24dp_5F6368_FILL0_wght300_GRAD200_opsz24.svg",
                                  width: 40,
                                  height: 40,
                                  color: !isPowerOn
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Text("시동"),
                        ],
                      ),

                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setLock(!isLock);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                color: isLock
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                              width: 70,
                              height: 70,
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/lock_24dp_5F6368_FILL0_wght300_GRAD200_opsz24.svg",
                                  width: 40,
                                  height: 40,
                                  color: !isLock ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Text("도어"),
                        ],
                      ),

                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setDoor(!isDoorOpen);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                color: isDoorOpen
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                              width: 70,
                              height: 70,
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/car-door-svgrepo-com.svg",
                                  width: 40,
                                  height: 40,
                                  color: !isDoorOpen
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Text("창문"),
                        ],
                      ),

                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setWarning(!isWarning);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                color: isWarning
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                              width: 70,
                              height: 70,
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/warning_24dp_5F6368_FILL0_wght300_GRAD200_opsz24.svg",
                                  width: 40,
                                  height: 40,
                                  color: isWarning
                                      ? warningColor
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Text("비상등"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Brown님 안녕하세요",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: size.width,
                          height: 240,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/car-svgrepo-com.svg", color: Color.fromRGBO(130,108,103, 1), width: 30,)
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
