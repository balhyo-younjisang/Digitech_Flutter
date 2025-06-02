import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color _backgroundColor;
  final String _text;
  final TextStyle _textStyle;
  final BorderRadius _radius;
  final VoidCallback _callback;

  CustomButton({
    super.key,
    Color backgroundColor = const Color.fromRGBO(192, 4, 31, 1),
    required String text,
    BorderRadius? radius,
    TextStyle textStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    required VoidCallback callback,
  }) : _backgroundColor = backgroundColor,
       _text = text,
       _radius = (radius ?? BorderRadius.circular(12)),
       _textStyle = textStyle,
       _callback = callback;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: _callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: _radius),
        minimumSize: Size(size.width, 50)
      ),
      child: Text(_text, style: _textStyle),
    );
  }
}
