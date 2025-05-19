import 'package:flutter/material.dart';

class KeypadTile extends StatelessWidget {
  final String keypadNumber;
  final String specialCharacter;
  final Function(String name) clickHandler;

  const KeypadTile({
    super.key,
    required this.keypadNumber,
    required this.specialCharacter,
    required this.clickHandler,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 80,
      child: InkWell(
        onTap: () {
          clickHandler(keypadNumber);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              keypadNumber,
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            Text(
              specialCharacter.toUpperCase(),
              style: TextStyle(fontSize: 16, color: Colors.white30),
            ),
          ],
        ),
      ),
    );
  }
}
