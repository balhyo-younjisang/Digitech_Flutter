import 'package:flutter/services.dart';

class ContactNumberFormatter extends TextInputFormatter {
  static final regex = RegExp(r'^010-?([0-9]]{4})-?([0-9]{4})$');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    if(newText.startsWith('010-')) {
      newText = '010-$newText';
    }

    if(regex.hasMatch(newText)) {
      return TextEditingValue(text: newText);
    } else {
      return TextEditingValue(text: regex.allMatches(newText).map((text) => text.group(0)).toString());
    }
  }

}