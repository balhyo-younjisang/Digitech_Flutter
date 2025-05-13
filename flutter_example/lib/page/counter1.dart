import 'package:flutter/material.dart';

class Counter1Page extends StatefulWidget {
  const Counter1Page({super.key});

  @override
  State<Counter1Page> createState() => _Counter1PageState();
}

class _Counter1PageState extends State<Counter1Page> {
  int _count = 0;
  String _errorMessage = "";

  void updateCount(int count) {
    setState(() {
      _count = count;
    });
  }

  void updateErrorMessage(String message) {
    setState(() {
      _errorMessage = message;
    });

    Future.delayed(const Duration(milliseconds: 1500)).whenComplete(() {
      setState(() {
        _errorMessage = "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("지금 번호는 $_count 입니다."),
          SizedBox(height: 30),
          FloatingActionButton(
            onPressed: () {
              if (_count >= 20) {
                updateErrorMessage("더 이상 커질 수 없어요.");
              } else {
                updateCount(_count + 1);
              }
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 30),
          FloatingActionButton(
            onPressed: () {
              if (_count <= 0) {
                updateErrorMessage("더 이상 작아질 수 없어요.");
              } else {
                updateCount(_count - 1);
              }
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 30),
          FloatingActionButton(
            onPressed: () {
              updateErrorMessage("");
              updateCount(0);
            },
            child: Icon(Icons.refresh),
          ),
          SizedBox(height: 50),
          Text(
            _errorMessage.isEmpty ? "" : _errorMessage,
            style: TextStyle(color: Colors.red),
          ),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("뒤로 가기"))
        ],
      ),
    ));
  }
}
