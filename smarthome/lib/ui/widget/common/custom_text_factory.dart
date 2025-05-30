import 'package:flutter/material.dart';

enum TextType {
  h1,
  h2,
  h3,
  h4,
  h5
}

abstract class CustomTextFactory {
  Text build(TextType textType, String text, [Color? color, double? size]);
}

class BoldTextFactory extends CustomTextFactory {
  @override
  build(TextType textType, String text, [Color? color, double? size]) {
    switch(textType) {
      case TextType.h1:
        return BoldText.h1(text, color: color, size: 32);
      case TextType.h2:
        return BoldText.h2(text, color: color, size: 20);
      case TextType.h3:
        return BoldText.h3(text, color: color, size: 18);
      case TextType.h4:
        return BoldText.h4(text, color: color, size: 16);
      case TextType.h5:
        return BoldText.h5(text, color: color, size: 14);
    }
  }
}

class SimpleCustomTextFactory extends CustomTextFactory {
  @override
  build(TextType textType, String text, [Color? color, double? size]) {
    switch(textType) {
      case TextType.h1:
        return SimpleCustomStyleText.h1(text, color: color, size: 32);
      case TextType.h2:
        return SimpleCustomStyleText.h2(text, color: color, size: 20);
      case TextType.h3:
        return SimpleCustomStyleText.h3(text, color: color, size: 18);
      case TextType.h4:
        return SimpleCustomStyleText.h4(text, color: color, size: 16);
      case TextType.h5:
        return SimpleCustomStyleText.h5(text, color: color, size: 14);
    }
  }
}

class CustomTextProducer {
  static CustomTextFactory getFactory({required bool isBold}) {
    if(isBold) {
      return BoldTextFactory();
    } else {
      return SimpleCustomTextFactory();
    }
  }
}

class BoldText extends Text {
  final double? size;
  final Color? color;

  BoldText(super.data, {super.key, this.size, this.color})
      : super(
    style: TextStyle(
      fontSize: size,
      color: color ?? Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
  BoldText.toText(super.text, {super.key, this.size, this.color})
      : super(
    style: TextStyle(
      fontSize: size,
      color: color ?? Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
  BoldText.h1(super.data, {super.key, this.size = 32, this.color})
      : super(
    style: TextStyle(
      fontSize: size,
      color: color ?? Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
  BoldText.h2(super.data, {super.key, this.size = 20, this.color})
      : super(
    style: TextStyle(
      fontSize: size,
      color: color ?? Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
  BoldText.h3(super.data, {super.key, this.size = 18, this.color})
      : super(
    style: TextStyle(
      fontSize: size,
      color: color ?? Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
  BoldText.h4(super.data, {super.key, this.size = 16, this.color})
      : super(
    style: TextStyle(
      fontSize: size,
      color: color ?? Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
  BoldText.h5(super.data, {super.key, this.size = 14, this.color})
      : super(
    style: TextStyle(
      fontSize: size,
      color: color ?? Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}

class SimpleCustomStyleText extends Text {
  final double? size;
  final Color? color;

  SimpleCustomStyleText(super.data, {super.key, required this.size, this.color})
      : super(
    style: TextStyle(fontSize: size, color: color ?? Colors.black),
  );
  SimpleCustomStyleText.toText(
      super.text, {
        super.key,
        required this.size,
        this.color,
      }) : super(
    style: TextStyle(fontSize: size, color: color ?? Colors.black),
  );
  SimpleCustomStyleText.h1(super.data, {super.key, this.size = 32, this.color})
      : super(
    style: TextStyle(fontSize: size, color: color ?? Colors.black),
  );
  SimpleCustomStyleText.h2(super.data, {super.key, this.size = 20, this.color})
      : super(
    style: TextStyle(fontSize: size, color: color ?? Colors.black),
  );
  SimpleCustomStyleText.h3(super.data, {super.key, this.size = 18, this.color})
      : super(
    style: TextStyle(fontSize: size, color: color ?? Colors.black),
  );
  SimpleCustomStyleText.h4(super.data, {super.key, this.size = 16, this.color})
      : super(
    style: TextStyle(fontSize: size, color: color ?? Colors.black),
  );
  SimpleCustomStyleText.h5(super.data, {super.key, this.size = 14, this.color})
      : super(
    style: TextStyle(fontSize: size, color: color ?? Colors.black),
  );
}