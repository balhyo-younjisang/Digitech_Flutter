import 'dart:io';

import 'package:drivemate/model/car.dart';
import 'package:drivemate/view/widgets/button.dart';
import 'package:drivemate/view/widgets/icon_input.dart';
import 'package:drivemate/view/widgets/symbol_logo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'home_screen.dart';

class SelectCarPage extends StatefulWidget {
  const SelectCarPage({super.key});

  @override
  State<StatefulWidget> createState() => _SelectCarScreenState();
}

class _SelectCarScreenState extends State<SelectCarPage>
    with SingleTickerProviderStateMixin {
  final String cloudAsset = "assets/images/cloud1.png";
  final String frontCarAsset = "assets/images/front-car.webp";
  late final AnimationController _animationController;
  late final Animation<double> _carAnimation;
  late final TextEditingController _carNameController;
  late final TextEditingController _carNumberController;
  late final PageController _pageController;
  late int currentPage = 0;
  bool isRemember = false;

  final List<Car> _carList = [
    Car(
      imageLink:
          "assets/images/genesis-kr-electrified-gv70-colors-glossy-capri-blue-large.png",
      name: "Genesis GV70",
    ),
    Car(
      imageLink:
          "assets/images/genesis-kr-g80-facelift-sport-color-glossy-brooklyn-brown-large.png",
      name: "Genesis G80",
    ),
    Car(
      imageLink: "assets/images/genesis-kr-g90-black-specs-side-veiw-large.png",
      name: "Genesis G90",
    ),
    Car(
      imageLink:
          "assets/images/genesis-kr-gv80-facelift-color-glossy-capri-blue-large.png",
      name: "Genesis gv80",
    ),
  ];

  XFile? _image;
  final ImagePicker picker = ImagePicker();

  // Future getImage(ImageSource imageSource) async {
  //   final XFile? pickedFile = await picker.pickImage(source: imageSource);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = XFile(pickedFile.path);
  //     });
  //   }
  // }

  Future<List<Car>> _fetchCarListFromApi() async {
    await Future.delayed(const Duration(seconds: 2));
    return _carList;
  }

  void _onPageViewChange(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _carAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();
    _carNameController = TextEditingController();
    _carNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _carNumberController.dispose();
    _carNameController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 70),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(cloudAsset, width: size.width),
            ),
            FutureBuilder(
              future: _fetchCarListFromApi(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return _buildLoadingDialog();
                } else if (snapshot.hasError) {
                  return Text(
                    "알 수 없는 에러가 발생했습니다.",
                    style: TextStyle(color: Colors.red, fontSize: 32),
                  );
                } else {
                  if (_carList.isNotEmpty) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 120),
                          child: SymbolLogo(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                _pageController.animateToPage(
                                  currentPage - 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear,
                                );
                              },
                              icon: Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.8,
                              height: size.height * 0.4,
                              child: PageView.builder(
                                clipBehavior: Clip.hardEdge,
                                onPageChanged: _onPageViewChange,
                                itemCount: _carList.length,
                                controller: _pageController,
                                itemBuilder: (_, index) {
                                  return AnimatedBuilder(
                                    animation: _pageController,
                                    builder: (context, child) {
                                      return child!;
                                    },
                                    child: Column(
                                      children: [
                                        _carList[index].isFile
                                            ? Image.file(
                                                File(_carList[index].imageLink),
                                                height: 400,
                                                width: size.width,
                                              )
                                            : Image.asset(
                                                _carList[index].imageLink,
                                                height: 400,
                                                width: size.width,
                                              ),
                                        Text(
                                          _carList[index].name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                _pageController.animateToPage(
                                  currentPage + 1,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear,
                                );
                              },
                              icon: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: Switch(
                                        activeTrackColor: Color.fromRGBO(
                                          118,
                                          56,
                                          0,
                                          1.0,
                                        ),
                                        inactiveThumbColor: Colors.grey,
                                        thumbIcon:
                                            WidgetStateProperty.resolveWith<
                                              Icon?
                                            >((Set<WidgetState> states) {
                                              if (states.contains(
                                                WidgetState.selected,
                                              )) {
                                                return Icon(
                                                  Icons.circle,
                                                  color: Colors.deepOrange,
                                                  size: 30,
                                                );
                                              }
                                              return const Icon(
                                                Icons.circle,
                                                color: Colors.white10,
                                                size: 30,
                                              );
                                            }),
                                        value: isRemember,
                                        onChanged: (newValue) {
                                          setState(() {
                                            isRemember = newValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Remember",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(height: 40),
                              Column(
                                children: [
                                  Column(
                                    spacing: 20,
                                    children: [
                                      CustomButton(
                                        text: "이 차량 선택하기",
                                        radius: BorderRadius.circular(5),
                                        callback: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => HomePage(
                                                car: _carList[currentPage],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Opacity(
                                        opacity: 0.6,
                                        child: CustomButton(
                                          text: "차량 등록하기",
                                          radius: BorderRadius.circular(5),
                                          callback: () {
                                            selectCarDialog(context);
                                            _carNameController.text = "";
                                            _carNumberController.text = "";
                                          },
                                          backgroundColor: Colors.grey,
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
                    );
                  } else {
                    return Column(
                      spacing: 120,
                      children: [
                        SymbolLogo(),
                        Column(
                          children: [
                            ScaleTransition(
                              scale: _carAnimation,
                              child: Image.asset(frontCarAsset),
                            ),
                            SizedBox(
                              width: size.width * 0.8,
                              height: size.height * 0.2,
                              child: CustomButton(
                                text: "차량 등록 후 이용하기",
                                callback: () {
                                  selectCarDialog(context);
                                  setState(() {
                                    _image = null;
                                  });
                                  _carNameController.text = "";
                                  _carNumberController.text = "";
                                },
                                radius: BorderRadius.circular(3),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingDialog() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 30),
          Text(
            "차량 정보를 불러오는 중입니다",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  void selectCarDialog(context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, 1), end: const Offset(0, 0));
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      pageBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            var size = MediaQuery.of(context).size;

            return StatefulBuilder(
              builder: (context, setStateDialog) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Material(
                    elevation: 10,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Container(
                      height: 600,
                      margin: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "차량등록하기",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.cancel_outlined),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              spacing: 30,
                              children: [
                                IconInput(
                                  controller: _carNameController,
                                  icon: Icons.directions_car_rounded,
                                  label: "차량 이름",
                                ),
                                IconInput(
                                  controller: _carNumberController,
                                  icon: Icons.stay_primary_landscape_sharp,
                                  label: "차량 번호",
                                ),
                                _image == null
                                    ? InkWell(
                                        onTap: () {
                                          _showSelectDialog(setStateDialog);
                                          // getImage(ImageSource.gallery);
                                        },
                                        child: Container(
                                          width: size.width,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.image_outlined,
                                              size: 60,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          _showSelectDialog(setStateDialog);
                                          // getImage(ImageSource.gallery);
                                        },
                                        child: Container(
                                          width: size.width,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                          child: Center(
                                            child: Image.file(
                                              File(_image!.path),
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "이미지를 선택해주세요.",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "갤러리 앱 또는 카메라를 이용하실 수 있습니다.",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          CustomButton(
                            text: "차량 등록 후 이용하기",
                            callback: () {
                              if (_carNameController.text.isEmpty ||
                                  _image == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('차량 이름과 이미지를 모두 입력해주세요.'),
                                  ),
                                );
                                return;
                              }

                              setState(() {
                                _carList.add(
                                  Car(
                                    imageLink: _image!.path,
                                    name: _carNameController.text,
                                    isFile: true,
                                  ),
                                );
                                _image = null;
                                _carNameController.clear();
                                _carNumberController.clear();
                              });

                              Navigator.of(context).pop(); // 다이얼로그 닫기
                            },
                            radius: BorderRadius.circular(3),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
    );
  }

  Future<void> _showSelectDialog(Function(Function()) setStateDialog) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter _) {
            return AlertDialog(
              content: const Text('카메라 또는 갤러리를 선택해주세요'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Camera'),
                  onPressed: () async {
                    final XFile? pickedFile = await picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        _image = XFile(pickedFile.path);
                      });
                    }
                    setStateDialog(() {});
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                TextButton(
                  child: const Text('Gallery'),
                  onPressed: () async {
                    // getImage(ImageSource.gallery);
                    final XFile? pickedFile = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        _image = XFile(pickedFile.path);
                      });
                    }
                    setStateDialog(() {});
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
