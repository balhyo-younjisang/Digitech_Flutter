import 'package:drivemate/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _symbolAnimation;
  late final Animation<Offset> _logoAnimation;
  late final Animation<double> _sloganAnimation;
  late final Animation<Offset> _carAnimation;

  final String symbolAsset =
      'assets/icons/hub_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg';
  final String carAsset =
      'assets/images/car.png';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _symbolAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.3, curve: Curves.ease),
    );
    _logoAnimation = Tween(begin: const Offset(-1, 0), end: const Offset(0, 0))
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.3, 0.5, curve: Curves.ease),
          ),
        );
    _sloganAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.4, 0.8, curve: Curves.ease),
    );
    _carAnimation = Tween(begin: const Offset(1, 0), end : const Offset(0, 0)).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 1.0, curve: Curves.ease),
    ));

    _playAnimation();
  }

  Future<void> _playAnimation() async {
    try {
      await _animationController.forward().orCancel;
      await Future.delayed(const Duration(milliseconds: 2000));
    } on TickerCanceled {
      _animationController.dispose();
    } finally {
      if (mounted) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false,);
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _symbolAnimation,
                child: SvgPicture.asset(
                  symbolAsset,
                  colorFilter: const ColorFilter.mode(
                     Color.fromRGBO(178, 136, 124, 1),
                    BlendMode.srcIn,
                  ),
                  width: 60,
                  height: 90,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          SlideTransition(
            position: _logoAnimation,
            child: Text(
              "Drive Mate",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ScaleTransition(
            scale: _sloganAnimation,
            child: Text(
              "연결하고, 운전하고, 즐기세요",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
         SizedBox(height: 50,),
         SlideTransition(position: _carAnimation, child: Image.asset(carAsset),)
        ],
      ),
    );
  }
}
