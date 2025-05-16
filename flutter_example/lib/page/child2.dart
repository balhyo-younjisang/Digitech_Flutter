import 'package:flutter/material.dart';
import 'package:flutter_example/page/parent.dart';

class Child2Widget extends StatelessWidget {
  // final int count;
  // final void Function(int creaseNumber) updateCount;

  const Child2Widget({super.key, /*required this.count, required this.updateCount*/});

  @override
  Widget build(BuildContext context) {
    ParentState parentState = context.findAncestorStateOfType<ParentState>()!;
    return TextButton(
      onPressed: () {
        // updateCount(-2);
        parentState.updateCount(-2);
      },
      child: Text("decrease 2"),
    );
  }
}
