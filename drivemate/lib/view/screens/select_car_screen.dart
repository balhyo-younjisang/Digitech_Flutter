import 'dart:io';

import 'package:drivemate/view/widgets/button.dart';
import 'package:drivemate/view/widgets/icon_input.dart';
import 'package:drivemate/view/widgets/symbol_logo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  @override
  void initState() {
    super.initState();
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
            Column(
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
            ),
          ],
        ),
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
                                        onTap: ()  {
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
                              setState(() {
                                _image = null;
                              });
                              setStateDialog(() {});
                              Navigator.pop(context);
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
