import 'package:flutter/material.dart';
import 'package:flutter_example/page/parent.dart';

class Child1Widget extends StatelessWidget {
  const Child1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    ParentState parentState = context.findAncestorStateOfType<ParentState>()!;
    return TextButton(
      onPressed: () {
        parentState.updateCount(2);
       },
      child: Text("increase 2"),
    );
  }
}
