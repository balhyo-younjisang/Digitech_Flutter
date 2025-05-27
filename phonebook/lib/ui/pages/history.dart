import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:phonebook/domain/phone.dart';
import 'package:phonebook/ui/widgets/phonebook/content.dart';
import 'package:phonebook/ui/widgets/phonebook/header.dart';
import 'package:phonebook/ui/widgets/phonebook/nav.dart';
import 'package:phonebook/ui/widgets/phonebook/phone_history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int headerFlex = 3;
  int navFlex = 1;
  int contentFlex = 5;
  Iterable<CallLogEntry>? callLogEntries;

  // final List<PhoneDummy> phones = [
  //   PhoneDummy(
  //     UniqueKey(),
  //     name: "윤지상",
  //     phone: "010-9885-8536",
  //     isExpanded: false,
  //     phoneStatus: PhoneStatus.missingCall,
  //   ),
  //   PhoneDummy(
  //     UniqueKey(),
  //     name: "이예찬",
  //     phone: "010-1661-4523",
  //     isExpanded: false,
  //     phoneStatus: PhoneStatus.missingCall,
  //   ),
  // ];
  Future<Iterable<CallLogEntry>> getCallLog() async {
    return await CallLog.get();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCallLog().then((value) {
      setState(() {
        callLogEntries = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            HeaderWidget(
              headerFlex: headerFlex,
              title: "최근기록",
              description: "최근 연락한 연락처",
            ),
            PhoneNavWidget(
              navFlex: navFlex,
              icons: [Icons.filter_list, Icons.search, Icons.more_vert],
            ),
            SizedBox(height: 10),
            PhoneHistory(
              contentFlex: contentFlex,
              // phones: phones,
              entries: callLogEntries ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
