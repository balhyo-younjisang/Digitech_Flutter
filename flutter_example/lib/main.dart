import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Flutter 앱",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 39, 255),
          toolbarHeight: 80,
        ),
        body: CounterWidget(),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;
  int _result = 0;
  String _errorMessage = "";
  late TextEditingController _controller;

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

  bool _isDigit(String ch) => ch.codeUnitAt(0) >= '0'.codeUnitAt(0) && ch.codeUnitAt(0) <= '9'.codeUnitAt(0);

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_listenTextEditor);
  }

  void _listenTextEditor() {
    // setState(() => _result = _controller.text.runes.map((rune) => String.fromCharCode(rune)).where((ch) => _isDigit(ch)).length);

    RuneIterator iterator = _controller.text.runes.iterator;
    RegExp check = RegExp('[0-9]');
    int count = 0;

    while(iterator.moveNext()) {
      if(check.hasMatch(String.fromCharCode(iterator.current))) {
        count++;
      }
    }

    setState(() {
      _result = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text("지금 번호는 $_count 입니다."),
          // SizedBox(height: 30),
          // FloatingActionButton(
          //   onPressed: () {
          //     if (_count >= 20) {
          //       updateErrorMessage("더 이상 커질 수 없어요.");
          //     } else {
          //       updateCount(_count + 1);
          //     }
          //   },
          //   child: Icon(Icons.add),
          // ),
          // SizedBox(height: 30),
          // FloatingActionButton(
          //   onPressed: () {
          //     if (_count <= 0) {
          //       updateErrorMessage("더 이상 작아질 수 없어요.");
          //     } else {
          //       updateCount(_count - 1);
          //     }
          //   },
          //   child: Icon(Icons.remove),
          // ),
          // SizedBox(height: 30),
          // FloatingActionButton(
          //   onPressed: () {
          //     updateErrorMessage("");
          //     updateCount(0);
          //   },
          //   child: Icon(Icons.refresh),
          // ),
          // SizedBox(height: 50),
          // Text(
          //   _errorMessage.isEmpty ? "" : _errorMessage,
          //   style: TextStyle(color: Colors.red),
          // ),Text("지금 번호는 $_count 입니다."),
          // SizedBox(height: 30),
          // FloatingActionButton(
          //   onPressed: () {
          //     if (_count >= 20) {
          //       updateErrorMessage("더 이상 커질 수 없어요.");
          //     } else {
          //       updateCount(_count + 1);
          //     }
          //   },
          //   child: Icon(Icons.add),
          // ),
          // SizedBox(height: 30),
          // FloatingActionButton(
          //   onPressed: () {
          //     if (_count <= 0) {
          //       updateErrorMessage("더 이상 작아질 수 없어요.");
          //     } else {
          //       updateCount(_count - 1);
          //     }
          //   },
          //   child: Icon(Icons.remove),
          // ),
          // SizedBox(height: 30),
          // FloatingActionButton(
          //   onPressed: () {
          //     updateErrorMessage("");
          //     updateCount(0);
          //   },
          //   child: Icon(Icons.refresh),
          // ),
          // SizedBox(height: 50),
          // Text(
          //   _errorMessage.isEmpty ? "" : _errorMessage,
          //   style: TextStyle(color: Colors.red),
          // ),
          Text("문자열에 속한 숫자의 총 개수는 : $_result"),
          SizedBox(height: 30),
          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "문자열을 입력해주세요.",
                focusColor: Colors.blueAccent,
              ),
              controller: _controller
            ),
          ),
        ],
      ),
    );
  }
}
