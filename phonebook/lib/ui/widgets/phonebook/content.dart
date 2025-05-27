import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:phonebook/ui/widgets/phonebook/content_tile.dart';

class PhoneContentWidget extends StatefulWidget {
  final int contentFlex;
  final List<Contact> phones;
  final LinearGradient? gradient;

  const PhoneContentWidget({
    super.key,
    required this.contentFlex,
    required this.phones,
    required this.gradient,
  });

  @override
  State<StatefulWidget> createState() => PhoneContentWidgetState();
}

class PhoneContentWidgetState extends State<PhoneContentWidget> {
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
              widget.phones.map((phone) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: ContentTile(
                    gradient: widget.gradient,
                    displayName: phone.displayName,
                    phones: phone.phones,
                    changeController: changeController,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
