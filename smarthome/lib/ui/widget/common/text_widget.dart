import 'package:flutter/material.dart';
import 'package:smarthome/ui/widget/common/custom_text_factory.dart';

class TitleWidget extends StatelessWidget {
  final String _pageTitle;
  final String _pageDescription;
  static const double letterSpacing = -1;
  static CustomTextFactory customTextFactory = CustomTextProducer.getFactory(isBold: true);

  const TitleWidget({super.key, required pageTitle, required pageDescription})
    : this._pageTitle = pageTitle,
      this._pageDescription = pageDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextFactory.build(TextType.h1, _pageTitle),
        Text(
          _pageDescription,
          style: TextStyle(fontSize: 20, letterSpacing: letterSpacing),
        ),
      ],
    );
  }
}
