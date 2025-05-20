import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final int headerFlex;
  // final int phoneLength;
  final String title;
  final String description;

  const HeaderWidget({super.key, required this.headerFlex, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: headerFlex,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            // "전화",
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            // "전화번호가 저장된 연락처 $phoneLength개",
            description,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}