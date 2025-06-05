import 'package:drivemate/model/car.dart';
import 'package:drivemate/model/tab_state.dart';
import 'package:drivemate/view/screens/home_screen.dart';
import 'package:drivemate/view/widgets/car_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatusPage extends StatefulWidget {
  final Car car;
  final String? title;
  const StatusPage({super.key, required this.car, this.title});

  @override
  State<StatefulWidget> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  List<ControllerTabState> controllerState = [
    ControllerTabState(
      assets:
          "assets/icons/mode_cool_24dp_5F6368_FILL0_wght300_GRAD200_opsz24.svg",
      name: "냉/난방",
      state: false,
      activateText: "켜짐",
      inactivateText: "꺼짐",
      isHeater: false,
      isRotate: false,
      isUnder: false,
    ),
    ControllerTabState(
      assets: "assets/icons/handle.svg",
      name: "핸들 열선",
      state: false,
      activateText: "켜짐",
      inactivateText: "꺼짐",
      isHeater: true,
      isRotate: false,
      isUnder: false,
    ),
    ControllerTabState(
      assets: "assets/icons/mirror-svgrepo-com.svg",
      name: "앞유리 성에 제거",
      state: false,
      activateText: "켜짐",
      inactivateText: "꺼짐",
      isHeater: true,
      isRotate: true,
      isUnder: false,
    ),
    ControllerTabState(
      assets: "assets/icons/mirror-svgrepo-com.svg",
      name: "뒷유리 열선",
      state: false,
      activateText: "켜짐",
      inactivateText: "꺼짐",
      isHeater: true,
      isRotate: true,
      isUnder: true,
    ),
    ControllerTabState(
      assets: "assets/icons/side mirror.svg",
      name: "사이드미러 열선",
      state: false,
      activateText: "켜짐",
      inactivateText: "꺼짐",
      isHeater: true,
      isRotate: false,
      isUnder: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    HomePageState? homePageState = context
        .findRootAncestorStateOfType<HomePageState>();

    final List<Tab> tabs = [
      Tab(
        child: SizedBox(
          width: size.width / 2,
          child: Text("차량", textAlign: TextAlign.center),
        ),
      ),
      Tab(
        child: SizedBox(
          width: size.width / 2,
          child: Text("공조", textAlign: TextAlign.center),
        ),
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: CarAppBar(carName: widget.car.name, title: "Status"),
          bottom: TabBar(
            tabs: tabs,
            indicatorColor: Color.fromRGBO(178, 136, 124, 1),
            labelColor: Color.fromRGBO(178, 136, 124, 1),
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "차량 상태",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/door2.svg",
                                      width: 30,
                                      color: homePageState!.isDoorOpen
                                          ? Color.fromRGBO(178, 136, 124, 1)
                                          : Colors.black,
                                    ),
                                    Text(
                                      "도어",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      homePageState.setDoor(
                                        !homePageState.isDoorOpen,
                                      );
                                    });
                                  },
                                  child: Text(
                                    homePageState.isDoorOpen ? "열림" : "잠김",
                                    style: TextStyle(
                                      color: homePageState.isDoorOpen
                                          ? Color.fromRGBO(178, 136, 124, 1)
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/car-door-svgrepo-com.svg",
                                      width: 30,
                                      color: homePageState!.isLock
                                          ? Color.fromRGBO(178, 136, 124, 1)
                                          : Colors.black,
                                    ),
                                    Text(
                                      "창문",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      homePageState.setLock(
                                        !homePageState.isLock,
                                      );
                                    });
                                  },
                                  child: Text(
                                    homePageState.isLock ? "열림" : "닫힘",
                                    style: TextStyle(
                                      color: homePageState.isLock
                                          ? Color.fromRGBO(178, 136, 124, 1)
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/tailgate.svg",
                                      width: 30,
                                      color: homePageState!.isTailgateOpen
                                          ? Color.fromRGBO(178, 136, 124, 1)
                                          : Colors.black,
                                    ),
                                    Text(
                                      "테일게이트",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      homePageState.setTailgate(
                                        !homePageState.isTailgateOpen,
                                      );
                                    });
                                  },
                                  child: Text(
                                    homePageState.isTailgateOpen ? "열림" : "닫힘",
                                    style: TextStyle(
                                      color: homePageState.isTailgateOpen
                                          ? Color.fromRGBO(178, 136, 124, 1)
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/door2.svg",
                                      width: 30,
                                      color: homePageState!.isHoodOpen
                                          ? Color.fromRGBO(178, 136, 124, 1)
                                          : Colors.black,
                                    ),
                                    Text(
                                      "도어",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      homePageState.setHood(
                                        !homePageState.isHoodOpen,
                                      );
                                    });
                                  },
                                  child: Text(
                                    homePageState.isHoodOpen ? "열림" : "닫힘",
                                    style: TextStyle(
                                      color: homePageState.isHoodOpen
                                          ? Color.fromRGBO(178, 136, 124, 1)
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "공조 상태",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: controllerState.map((car) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    car.isHeater
                                        ? Stack(
                                            children: [
                                              !car.isUnder
                                                  ? Positioned(
                                                      top: -5,
                                                      right: 5,
                                                      child: SvgPicture.asset(
                                                        "assets/icons/heat.svg",
                                                        width: 20,
                                                        color: car.state
                                                            ? Color.fromRGBO(
                                                                178,
                                                                136,
                                                                124,
                                                                1,
                                                              )
                                                            : Colors.black,
                                                      ),
                                                    )
                                                  : SizedBox(),
                                              car.isRotate
                                                  ? RotationTransition(
                                                      turns:
                                                          AlwaysStoppedAnimation(
                                                            90 / 360,
                                                          ),
                                                      child: SvgPicture.asset(
                                                        car.assets,
                                                        width: 30,
                                                        color: car.state
                                                            ? Color.fromRGBO(
                                                                178,
                                                                136,
                                                                124,
                                                                1,
                                                              )
                                                            : Colors.black,
                                                      ),
                                                    )
                                                  : SvgPicture.asset(
                                                      car.assets,
                                                      width: 30,
                                                      color: car.state
                                                          ? Color.fromRGBO(
                                                              178,
                                                              136,
                                                              124,
                                                              1,
                                                            )
                                                          : Colors.black,
                                                    ),
                                              car.isUnder
                                                  ? Positioned(
                                                      top: 15,
                                                      right: 5,
                                                      child: SvgPicture.asset(
                                                        "assets/icons/heat.svg",
                                                        width: 20,
                                                        color: car.state
                                                            ? Color.fromRGBO(
                                                                178,
                                                                136,
                                                                124,
                                                                1,
                                                              )
                                                            : Colors.black,
                                                      ),
                                                    )
                                                  : SizedBox(),
                                            ],
                                          )
                                        : car.isRotate
                                        ? RotationTransition(
                                            turns: AlwaysStoppedAnimation(
                                              90 / 360,
                                            ),
                                            child: SvgPicture.asset(
                                              car.assets,
                                              width: 30,
                                              color: car.state
                                                  ? Color.fromRGBO(
                                                      178,
                                                      136,
                                                      124,
                                                      1,
                                                    )
                                                  : Colors.black,
                                            ),
                                          )
                                        : SvgPicture.asset(
                                            car.assets,
                                            width: 30,
                                            color: car.state
                                                ? Color.fromRGBO(
                                                    178,
                                                    136,
                                                    124,
                                                    1,
                                                  )
                                                : Colors.black,
                                          ),
                                    Text(
                                      car.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      car.changeState(!car.state);
                                    });
                                  },
                                  child: Text(
                                    car.stateText(),
                                    style: TextStyle(
                                      color: car.state
                                          ? Color.fromRGBO(178, 136, 124, 1)
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                          ],
                        );
                      }).toList(),
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
