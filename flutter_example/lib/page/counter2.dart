import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _result = 0;
  late TextEditingController _controller;

  bool _isDigit(String ch) =>
      ch.codeUnitAt(0) >= '0'.codeUnitAt(0) &&
      ch.codeUnitAt(0) <= '9'.codeUnitAt(0);

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_listenTextEditor);
  }

  void _listenTextEditor() {
    setState(
      () =>
          _result =
              _controller.text.runes
                  .map((rune) => String.fromCharCode(rune))
                  .where((ch) => _isDigit(ch))
                  .length,
    );

    // RuneIterator iterator = _controller.text.runes.iterator;
    // RegExp check = RegExp('[0-9]');
    // int count = 0;
    //
    // while(iterator.moveNext()) {
    //   if(check.hasMatch(String.fromCharCode(iterator.current))) {
    //     count++;
    //   }
    // }
    //
    // setState(() {
    //   _result = count;
    // });`
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
                controller: _controller,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("뒤로 가기"),
            ),
          ],
        ),
      ),
    );
  }
}
