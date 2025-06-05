import 'dart:async';
import 'dart:io';

import 'package:drivemate/model/user.dart';
import 'package:drivemate/view/screens/home_screen.dart';
import 'package:drivemate/view/widgets/car_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final ScrollController _cloudScrollController;

  late Timer timer;
  late Color warningColor = Colors.red;
  late final Timer _cloudTimer;
  late List<String> cloudImageList;
  bool isWidgetOpen = false;
  bool isLoading = false;
  bool isWarning = false;

  void setWidget(bool value) {
    setState(() {
      isWidgetOpen = value;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() async {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(const Duration(milliseconds: 2000));
        setState(() {
          isLoading = false;
        });
        _scrollController.jumpTo(0);
      }
    });

    cloudImageList = ["assets/images/cloud3.png", "assets/images/cloud2.png"];
    _cloudScrollController = ScrollController();
    _cloudTimer = Timer.periodic(Duration(milliseconds: 2000), (timer) {
      setState(() {
        cloudImageList.add(cloudImageList[cloudImageList.length % 2]);
      });
      _cloudScrollController.animateTo(
        _cloudScrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 2000),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    _cloudTimer.cancel();
    _scrollController.dispose();
    _cloudScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    HomePageState? homePageState = context
        .findRootAncestorStateOfType<HomePageState>();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blueAccent, Colors.white],
        ),
      ),
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.5,
              child: ListView.builder(
                controller: _cloudScrollController,
                physics: NeverScrollableScrollPhysics(),
                reverse: true,
                itemCount: cloudImageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(cloudImageList[index]);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  CarAppBar(carName: homePageState!.widget.car.name),
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: homePageState.widget.car.isFile ?  Image.file(
                            File(homePageState.widget.car.imageLink),
                            width: size.width,
                            height: 200,
                          ) : Image.asset(
                            homePageState.widget.car.imageLink,
                          ),
                        ),
                        isWidgetOpen
                            ? Positioned(
                                top: 100,
                                child: Container(
                                  width: size.width,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withAlpha(200),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 3,
                                          horizontal: 10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              spacing: 5,
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/icons/hub_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg",
                                                  color: Color.fromRGBO(
                                                    178,
                                                    136,
                                                    124,
                                                    1,
                                                  ),
                                                  width: 32,
                                                ),
                                                Text(
                                                  "Drive Mate",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SvgPicture.asset(
                                              "assets/icons/settings_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg",
                                              width: 32,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              homePageState
                                                  .widget
                                                  .car
                                                  .imageLink,
                                              width: 280,
                                            ),
                                            SizedBox(
                                              height: 120,
                                              child: Row(
                                                // crossAxisAlignment:
                                                //     CrossAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        homePageState.isLock =
                                                            false;
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 70,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: SvgPicture.asset(
                                                        "assets/icons/lock_24dp_5F6368_FILL0_wght300_GRAD200_opsz24.svg",
                                                        color:
                                                            homePageState
                                                                    .isLock ==
                                                                false
                                                            ? Color.fromRGBO(
                                                                178,
                                                                136,
                                                                124,
                                                                1,
                                                              )
                                                            : Colors.grey
                                                                  .withAlpha(
                                                                    200,
                                                                  ),
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      homePageState.setPower(
                                                        !homePageState
                                                            .isPowerOn,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: SvgPicture.asset(
                                                        "assets/icons/power_settings_new_24dp_5F6368_FILL0_wght300_GRAD200_opsz24.svg",
                                                        color:
                                                            homePageState
                                                                .isPowerOn
                                                            ? Color.fromRGBO(
                                                                178,
                                                                136,
                                                                124,
                                                                1,
                                                              )
                                                            : Colors.grey
                                                                  .withAlpha(
                                                                    200,
                                                                  ),
                                                        height: 60,
                                                        width: 80,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      homePageState.setLock(
                                                        !homePageState.isLock,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 80,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: SvgPicture.asset(
                                                        "assets/icons/lock_open_24dp_5F6368_FILL0_wght300_GRAD200_opsz24.svg",
                                                        color:
                                                            homePageState
                                                                    .isLock ==
                                                                true
                                                            ? Color.fromRGBO(
                                                                178,
                                                                136,
                                                                124,
                                                                1,
                                                              )
                                                            : Colors.grey
                                                                  .withAlpha(
                                                                    200,
                                                                  ),
                                                        height: 40,
                                                        width: 40,
                                                      ),
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
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              homePageState.setPower(!homePageState.isPowerOn);
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
                                color: homePageState.isPowerOn
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
                                  color: !homePageState.isPowerOn
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
                              homePageState.setLock(!homePageState.isLock);
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
                                color: homePageState.isLock
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
                                  color: !homePageState.isLock
                                      ? Colors.black
                                      : Colors.white,
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
                              homePageState.setDoor(!homePageState.isDoorOpen);
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
                                color: homePageState.isDoorOpen
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
                                  color: !homePageState.isDoorOpen
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
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${User.username}님 안녕하세요",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: size.width,
                          height: 360,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              spacing: 10,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      spacing: 10,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/car-svgrepo-com.svg",
                                          color: Color.fromRGBO(
                                            178,
                                            136,
                                            124,
                                            1,
                                          ),
                                          width: 30,
                                        ),
                                        Text(
                                          "Vehicle control",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/chevron_right_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg",
                                      width: 28,
                                      height: 28,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: size.width,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withAlpha(120),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      spacing: 10,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/ventilating-fan-svgrepo-com.svg",
                                          color: Color.fromRGBO(
                                            178,
                                            136,
                                            124,
                                            1,
                                          ),
                                          width: 28,
                                        ),
                                        Text(
                                          "Climate",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/chevron_right_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg",
                                      width: 28,
                                      height: 28,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: size.width,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withAlpha(120),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      spacing: 10,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/my_location_black_24dp.svg",
                                          color: Color.fromRGBO(
                                            178,
                                            136,
                                            124,
                                            1,
                                          ),
                                          width: 30,
                                        ),
                                        Text(
                                          "Location",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/chevron_right_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg",
                                      width: 28,
                                      height: 28,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: size.width,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withAlpha(120),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      spacing: 10,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/vpn_key_black_24dp.svg",
                                          color: Color.fromRGBO(
                                            178,
                                            136,
                                            124,
                                            1,
                                          ),
                                          width: 30,
                                        ),
                                        Text(
                                          "Valet Mode",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/chevron_right_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg",
                                      width: 28,
                                      height: 28,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: size.width,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withAlpha(120),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  isLoading ? CircularProgressIndicator() : SizedBox(),
                ],
              ),
            ),
        Positioned(top: size.height * 0.75, left: size.width * 0.9, child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            // setState(() {
            //   isWidgetOpen = !isWidgetOpen;
            // });
            setWidget(!isWidgetOpen);
          },
          shape: CircleBorder(),
          child: SvgPicture.asset(
            "assets/icons/power_settings_new_24dp_5F6368_FILL0_wght300_GRAD200_opsz24.svg",
            width: 30,
            color: Color.fromRGBO(178, 136, 124, 1),
          ),
        ),)
          ],
        ),
      ),
    );
  }
}
