import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:phonebook/ui/widgets/phonebook/HistoryTile.dart';
import 'package:phonebook/ui/widgets/phonebook/content_tile.dart';

class PhoneHistory extends StatefulWidget {
  final int contentFlex;
  final Iterable<CallLogEntry> entries;

  const PhoneHistory({
    super.key,
    required this.contentFlex,
    required this.entries,
  });

  @override
  State<StatefulWidget> createState() => PhoneHistoryState();
}

class PhoneHistoryState extends State<PhoneHistory> {
  ExpansionTileController? currentExpandController;
  void changeController(ExpansionTileController controller) {
    if (currentExpandController != null &&
        currentExpandController.hashCode != controller.hashCode) {
      currentExpandController!.collapse();
    }
    currentExpandController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: widget.contentFlex,
      child: SingleChildScrollView(
        child: Column(
          children:
              widget.entries.map((entry) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: HistoryTile(
                    displayName: entry.name,
                    phone: entry.number,
                    changeController: changeController,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
