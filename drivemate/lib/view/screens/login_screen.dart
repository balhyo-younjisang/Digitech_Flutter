import 'package:drivemate/utils/string_util.dart';
import 'package:drivemate/view/screens/select_car_screen.dart';
import 'package:drivemate/view/widgets/button.dart';
import 'package:drivemate/view/widgets/icon_input.dart';
import 'package:drivemate/view/widgets/symbol_logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final String redCarAsset = "assets/images/red_car.png";
  late final AnimationController _animationController;
  late final AnimationController _toastController;
  late final Animation<Offset> _slideAnimation;
  late final Animation<Offset> _toastAnimation;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  var isRemember = false;
  String toastMessage = "";

  @override
  void initState() {
    super.initState();
    _toastController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _slideAnimation = Tween(begin: Offset(1.0, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
    _toastAnimation = Tween(
      begin: Offset(0, -1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _toastController, curve: Curves.linear));
    _animationController.forward();

    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _toastController.dispose();
  }

  void showToastMessage(String message) async {
    setState(() {
      toastMessage = message;
    });
    _toastController.forward();
    await Future.delayed(const Duration(milliseconds: 1000));
    await _toastController.reverse();
    setState(() {
      toastMessage = "";
    });
  }

  bool validateUserInput() {
    bool isFailed = false;

    // 사용자 이름 또는 비밀번호가 입력되지 않음
    String inputUserName = _usernameController.text;
    String inputUserPassword = _passwordController.text;

    List<StringValidator> usernameValidator = StringUtility.createValidator();
    StringUtility.addValidator(
      usernameValidator,
      (input) => StringUtility.isStringEmpty(input, "Username", false),
    );
    StringUtility.addValidator(
      usernameValidator,
      (input) => StringUtility.isStringIncludeBlank(input, "Username", false),
    );
    StringUtility.addValidator(
      usernameValidator,
      (input) => StringUtility.isStringShorterThan(input, 4, "Username", false),
    );

    List<StringValidator> passwordValidator = StringUtility.createValidator();
    StringUtility.addValidator(
      passwordValidator,
      (input) => StringUtility.isStringEmpty(input, "Password", false),
    );
    StringUtility.addValidator(
      passwordValidator,
      (input) => StringUtility.isStringShorterThan(input, 4, "Password", false),
    );

    for (var validator in usernameValidator) {
      final result = validator(inputUserName);
      print("${result.message} :: ${result.isTrue} / $inputUserName");
      if (result.isTrue && !isFailed) {
        showToastMessage(result.message);
        isFailed = true;
      }
    }

    for (var validator in passwordValidator) {
      final result = validator(inputUserPassword);
      print("${result.message} :: ${result.isTrue}");
      if (result.isTrue && !isFailed) {
        showToastMessage(result.message);
        isFailed = true;
      }
    }

    return !isFailed;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              child: toastMessage.isNotEmpty
                  ? SlideTransition(
                      position: _toastAnimation,
                      child: Container(
                        width: size.width,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          toastMessage,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 70),
              child: Column(
                children: [
                  SymbolLogo(),
                  SlideTransition(
                    position: _slideAnimation,
                    child: Image.asset(redCarAsset),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      spacing: 10,
                      children: [
                        Text(
                          "로그인 정보를 입력하세요.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            height: 4,
                          ),
                        ),
                        IconInput(
                          controller: _usernameController,
                          icon: Icons.person_rounded,
                          label: "Username",
                        ),
                        IconInput(
                          controller: _passwordController,
                          icon: Icons.lock_rounded,
                          label: "Password",
                          isSecure: true,
                        ),
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
                                      WidgetStateProperty.resolveWith<Icon?>((
                                        Set<WidgetState> states,
                                      ) {
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
                        CustomButton(
                          text: "Sign In",
                          radius: BorderRadius.circular(5),
                          callback: () {
                            bool isValidationSuccess = validateUserInput();

                            if (isValidationSuccess) {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SelectCarPage()), (route) => false,);
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            spacing: 10,
                            children: [
                              CustomButton(
                                text: "Sign Up",
                                radius: BorderRadius.circular(5),
                                callback: () {
                                  showToastMessage("아직 회원가입 페이지는 구현되지 않았어요.");
                                },
                                backgroundColor: Colors.grey,
                              ),
                              CustomButton(
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(color: Colors.black),
                                text: "Password Reset",
                                radius: BorderRadius.circular(5),
                                callback: () {
                                  showToastMessage(
                                    "아직 비밀번호 초기화 기능은 구현되지 않았어요.",
                                  );
                                },
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
          ],
        ),
      ),
    );
  }
}
