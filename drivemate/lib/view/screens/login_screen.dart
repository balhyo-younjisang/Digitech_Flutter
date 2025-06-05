import 'package:drivemate/model/user.dart';
import 'package:drivemate/utils/string_util.dart';
import 'package:drivemate/view/screens/select_car_screen.dart';
import 'package:drivemate/view/widgets/button.dart';
import 'package:drivemate/view/widgets/icon_input.dart';
import 'package:drivemate/view/widgets/symbol_logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  // Constants
  static const String _redCarAsset = "assets/images/red_car.png";
  static const Duration _animationDuration = Duration(milliseconds: 2000);
  static const Duration _toastDuration = Duration(milliseconds: 300);
  static const Duration _toastDisplayDuration = Duration(milliseconds: 1000);
  static const int _minInputLength = 4;

  // Animation controllers
  late final AnimationController _slideAnimationController;
  late final AnimationController _toastAnimationController;
  late final Animation<Offset> _slideAnimation;
  late final Animation<Offset> _toastAnimation;

  // Form controllers
  late final TextEditingController usernameController;
  late final TextEditingController _passwordController;

  // State variables
  bool _isRememberMe = false;
  String _toastMessage = "";

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _initializeControllers();
  }

  @override
  void dispose() {
    _disposeAnimations();
    _disposeControllers();
    super.dispose();
  }

  // Initialization methods
  void _initializeAnimations() {
    _slideAnimationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _toastAnimationController = AnimationController(
      vsync: this,
      duration: _toastDuration,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideAnimationController,
      curve: Curves.easeInOut,
    ));

    _toastAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _toastAnimationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimationController.forward();
  }

  void _initializeControllers() {
    usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void _disposeAnimations() {
    _slideAnimationController.dispose();
    _toastAnimationController.dispose();
  }

  void _disposeControllers() {
    usernameController.dispose();
    _passwordController.dispose();
  }

  // Toast message methods
  Future<void> _showToastMessage(String message) async {
    setState(() {
      _toastMessage = message;
    });

    await _toastAnimationController.forward();
    await Future.delayed(_toastDisplayDuration);
    await _toastAnimationController.reverse();

    setState(() {
      _toastMessage = "";
    });
  }

  // Validation methods
  bool _validateUserInput() {
    var username = usernameController.text;
    final password = _passwordController.text;

    // Validate username
    final usernameValidators = StringUtility.createUsernameValidators(
      minLength: _minInputLength,
    );
    final usernameResult = StringUtility.validateWithValidators(
      username,
      usernameValidators,
    );

    if (!usernameResult.isValid) {
      _showToastMessage(usernameResult.message);
      return false;
    }

    // Validate password
    final passwordValidators = StringUtility.createPasswordValidators(
      minLength: _minInputLength,
    );
    final passwordResult = StringUtility.validateWithValidators(
      password,
      passwordValidators,
    );

    if (!passwordResult.isValid) {
      _showToastMessage(passwordResult.message);
      return false;
    }

    User.username = usernameController.text;
    return true;
  }

  // Navigation methods
  void _navigateToSelectCarPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SelectCarPage()),
          (route) => false,
    );
  }

  // Event handlers
  void _onSignInPressed() {
    if (_validateUserInput()) {
      _navigateToSelectCarPage();
    }
  }

  void _onSignUpPressed() {
    _showToastMessage("아직 회원가입 페이지는 구현되지 않았어요.");
  }

  void _onPasswordResetPressed() {
    _showToastMessage("아직 비밀번호 초기화 기능은 구현되지 않았어요.");
  }

  void _onRememberMeChanged(bool value) {
    setState(() {
      _isRememberMe = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildToastMessage(),
            _buildMainContent(size),
          ],
        ),
      ),
    );
  }

  // UI Building methods
  Widget _buildToastMessage() {
    if (_toastMessage.isEmpty) {
      return const SizedBox.shrink();
    }

    return Positioned(
      child: SlideTransition(
        position: _toastAnimation,
        child: Center(child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              _toastMessage,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildMainContent(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Column(
        children: [
          const SymbolLogo(),
          _buildCarImage(),
          _buildLoginForm(size),
        ],
      ),
    );
  }

  Widget _buildCarImage() {
    return SlideTransition(
      position: _slideAnimation,
      child: Image.asset(_redCarAsset),
    );
  }

  Widget _buildLoginForm(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(width: size.width * 0.8,  child:Column(
        spacing: 10,
        children: [
          _buildLoginTitle(),
          _buildUsernameField(),
          _buildPasswordField(),
          _buildRememberMeSwitch(),
          _buildSignInButton(),
          const SizedBox(height: 10),
          _buildAdditionalButtons(),
        ],
      )),
    );
  }

  Widget _buildLoginTitle() {
    return const Text(
      "로그인 정보를 입력하세요.",
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        height: 3,
      ),
    );
  }

  Widget _buildUsernameField() {
    return IconInput(
      controller: usernameController,
      icon: Icons.person_rounded,
      label: "Username",
    );
  }

  Widget _buildPasswordField() {
    return IconInput(
      controller: _passwordController,
      icon: Icons.lock_rounded,
      label: "Password",
      isSecure: true,
    );
  }

  Widget _buildRememberMeSwitch() {
    return Row(
      children: [
        SizedBox(
          height: 30,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Switch(
              activeTrackColor: const Color.fromRGBO(118, 56, 0, 1.0),
              inactiveThumbColor: Colors.grey,
              thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
                final isSelected = states.contains(WidgetState.selected);
                return Icon(
                  Icons.circle,
                  color: isSelected ? Colors.deepOrange : Colors.white10,
                  size: 30,
                );
              }),
              value: _isRememberMe,
              onChanged: _onRememberMeChanged,
            ),
          ),
        ),
        const Text(
          "Remember",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return CustomButton(
      text: "Sign In",
      radius: BorderRadius.circular(5),
      callback: _onSignInPressed,
    );
  }

  Widget _buildAdditionalButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        spacing: 10,
        children: [
          CustomButton(
            text: "Sign Up",
            radius: BorderRadius.circular(5),
            callback: _onSignUpPressed,
            backgroundColor: Colors.grey,
          ),
          CustomButton(
            backgroundColor: Colors.white,
            textStyle: const TextStyle(color: Colors.black),
            text: "Password Reset",
            radius: BorderRadius.circular(5),
            callback: _onPasswordResetPressed,
          ),
        ],
      ),
    );
  }
}