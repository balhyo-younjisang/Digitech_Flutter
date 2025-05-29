import 'package:flutter/material.dart';
import 'package:smarthome/ui/widget/common/size_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final _backgroundColor = const Color.fromRGBO(18, 40, 61, 1);
  double textOpacityLevel = 0.0;
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    _animationController.forward();
    Future.delayed(Duration(milliseconds: 3000), () {
      if (_animationController.isCompleted) _animationController.reverse();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomPaint(
        foregroundPainter: BackgroundPainter(),
        child: FullSizeBox(
          child: ColoredBox(
            color: _backgroundColor,
            child: Center(
              child: FadeTransition(
                opacity: _animation,
                child: Text(
                  "Smart Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {

    Paint background = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white.withAlpha(25)
      ..isAntiAlias = true
      ..strokeWidth = 20.0;

    Path path = Path()..moveTo(size.width, 0)..lineTo(size.width * 0.3, size.height * 0.25)..lineTo(size.width * 0.3, size.height);

    final rectX = Offset(size.width * 3 / 6, size.height * 1 / 3);
    final rectY = Offset(size.width * 1.5, size.height * 2 / 4);
    Rect rect = Rect.fromPoints(rectX, rectY);

    canvas.drawPath(path, background);
    canvas.drawRect(rect, background);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
