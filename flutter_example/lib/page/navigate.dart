import 'package:flutter/material.dart';
import 'package:flutter_example/page/counter1.dart';
import 'package:flutter_example/page/counter2.dart';

class NavigatePage extends StatelessWidget {
  const NavigatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Counter1Page()),
              );
            },
            child: Text("카운터 1로 이동"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CounterWidget()),
              );
            },
            child: Text("카운터로 이동"),
          ),
        ],
      ),
    ));
  }
}
