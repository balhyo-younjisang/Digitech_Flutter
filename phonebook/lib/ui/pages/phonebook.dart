import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
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

  List<Contact>? contactList;

  Future<dynamic> getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      return await FlutterContacts.getContacts();
    }
  }

  @override
  void initState()  {
    super.initState();
    // contactList = await getContacts();
    getContacts().then(
      (value) => {
        setState(() {
          contactList = value;
        }),
      },
    );
  }

  // final List<PhoneDummy> phones = [
  //   PhoneDummy(
  //     UniqueKey(),
  //     name: "정재훈",
  //     phone: "010-1111-2222",
  //     isExpanded: false,
  //     phoneStatus: PhoneStatus.profile,
  //   ),
  //   PhoneDummy(
  //     UniqueKey(),
  //     name: "이은상",
  //     phone: "010-3333-4444",
  //     isExpanded: false,
  //     phoneStatus: PhoneStatus.profile,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            HeaderWidget(
              headerFlex: headerFlex,
              title: "전화",
              description: "전화번호가 저장된 연락처 ${contactList?.length}개",
            ),
            PhoneNavWidget(
              navFlex: navFlex,
              icons: [Icons.add, Icons.search, Icons.more_vert],
            ),
            SizedBox(height: 10),
            PhoneContentWidget(
              contentFlex: contentFlex,
              phones: contactList ?? [],
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
