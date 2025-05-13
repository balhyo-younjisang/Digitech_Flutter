import 'package:flutter/material.dart';

final borderColor = Color.fromARGB(255, 219, 219, 219);
final double borderWidth = 1;

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 500,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 350,
        height: 500,
        child: Column(
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: borderColor, width: borderWidth),
                ),
              ),
            ),
            Container(height: 248),
            Container(
              height: 160,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: borderColor, width: borderWidth),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
