import 'package:flutter/material.dart';
import 'package:phonebook/domain/phone.dart';
import 'package:phonebook/ui/widgets/phonebook/content.dart';
import 'package:phonebook/ui/widgets/phonebook/header.dart';
import 'package:phonebook/ui/widgets/phonebook/nav.dart';

class PhoneBookScreen extends StatefulWidget {
  const PhoneBookScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PhoneBookScreenState();
}

class _PhoneBookScreenState extends State<PhoneBookScreen> {
  int headerFlex = 3;
  int navFlex = 1;
  int contentFlex = 5;

  final List<PhoneDummy> phones = [
    PhoneDummy(name: "윤지상", phone: "010-9885-8536"),
    PhoneDummy(name: "이예찬", phone: "010-1661-4523"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            HeaderWidget(headerFlex: headerFlex, phoneLength: phones.length),
            PhoneNavWidget(navFlex: navFlex),
            SizedBox(height: 10),
            PhoneContentWidget(contentFlex: contentFlex, phones: phones)
          ],
        ),
      ),
    );
  }
}
