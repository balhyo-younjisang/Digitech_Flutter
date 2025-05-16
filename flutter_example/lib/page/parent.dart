import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_example/page/child1.dart';

import 'child2.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<StatefulWidget> createState() => ParentState();
}

class ParentState extends State<ParentWidget>
    with SingleTickerProviderStateMixin {
  late int count;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isShaking = false;

  @override
  void initState() {
    super.initState();
    count = 0;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _isShaking = false;
          });
        }
      });
  }

  void _startShake() {
    setState(() => _isShaking = true);
    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void updateCount(int creaseNumber) {
    setState(() {
      count += creaseNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              Text("value is...", style: TextStyle(fontSize: 24)),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  double offset = sin(_animation.value * pi * 10) * 5;
                  return Transform.translate(
                    offset: Offset(offset, 0),
                    child: child,
                  );
                },
                child: Text(
                  "$count",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                _isShaking ? null : _startShake();
                updateCount(1);
              },
              child: Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () {
                _isShaking ? null : _startShake();
                updateCount(-1);
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
        SizedBox(height: 30),
        Column(
          spacing: 10,
          children: [Child1Widget(), Child2Widget(/*count: count, updateCount: updateCount,*/)],
        ),
      ],
    );
  }
}
