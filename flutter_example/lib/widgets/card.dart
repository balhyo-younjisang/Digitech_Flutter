import 'package:flutter/material.dart';

final borderColor = Color.fromARGB(255, 219, 219, 219);
final double borderWidth = 1;

class CardWidget extends StatelessWidget {
  // final int assetFlex;
  // final int contentFlex;
  // final int headerFlex;
  final double assetFlex;
  final double contentFlex;
  final double headerFlex;
  final double width;
  final double height;
  final String imagePath;

  // const CardWidget({
  //   super.key,
  //   required this.width,
  //   required this.height,
  //   this.headerFlex = 2,
  //   this.assetFlex = 5,
  //   this.contentFlex = 4,
  // });

  const CardWidget({
    super.key,
    required this.width,
    required this.height,
    this.headerFlex = 0.15,
    this.assetFlex = 0.5,
    this.contentFlex = 0.35,
    this.imagePath = "hyobin.jpg"
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              height: this.height * this.headerFlex,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: borderColor, width: borderWidth),
                ),
              ),
            ),
            Container(
              height: this.height * this.assetFlex,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: borderColor, width: borderWidth),
                ),
              ),
              child: Image(image: AssetImage(imagePath), fit: BoxFit.cover,),
            ),
            Container(
              height: this.height * this.contentFlex  - 2,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: borderColor, width: borderWidth),
                ),
              ),
              child: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
