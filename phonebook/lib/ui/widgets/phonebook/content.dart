import 'package:flutter/material.dart';
import 'package:phonebook/domain/phone.dart';
import 'package:phonebook/ui/widgets/phonebook/phone.dart';

class PhoneContentWidget extends StatelessWidget {
  final int contentFlex;
  final List<PhoneDummy> phones;

  const PhoneContentWidget({
    super.key,
    required this.contentFlex,
    required this.phones,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: contentFlex,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ...List.generate(
                  phones.length,
                  (index) => Column(
                    children: [
                      PhoneWidget(phoneData: phones[index]),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
