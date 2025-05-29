import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String _pageTitle;
  final String _pageDescription;
  static const double LetterSpacing = -1;

  const TitleWidget({super.key, required pageTitle, required pageDescription})
    : this._pageTitle = pageTitle,
      this._pageDescription = pageDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _pageTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.w900,
            letterSpacing: LetterSpacing,
          ),
        ),
        Text(
          _pageDescription,
          style: TextStyle(fontSize: 20, letterSpacing: LetterSpacing),
        ),
      ],
    );
  }
}
