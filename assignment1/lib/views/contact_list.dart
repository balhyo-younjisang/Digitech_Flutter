import 'package:assignment1/model/contact.dart';
import 'package:assignment1/model/user.dart';
import 'package:assignment1/utils/variable_util.dart';
import 'package:assignment1/widgets/contact_widget.dart';
import 'package:flutter/material.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({super.key});

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double height = size.height;
    final iconButtonConstraint = const BoxConstraints();

    return Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            SizedBox(
              height: height * 0.4,
              child: ContactBar(
                actions: [
                  IconButton(
                    constraints: iconButtonConstraint,
                    onPressed: Functions.empty,
                    icon: Icon(Icons.format_list_bulleted),
                    padding: EdgeInsets.zero
                  ),
                  IconButton(
                    constraints: iconButtonConstraint,
                    icon: Icon(Icons.search),
                    onPressed: Functions.empty,
                    padding: EdgeInsets.zero
                  ),
                  IconButton(
                    constraints: iconButtonConstraint,
                    icon: Icon(Icons.more_vert),
                    onPressed: Functions.empty,
                    padding: EdgeInsets.zero
                  )
                ],
              )
            ),
            Column(
              spacing: 15,
              children: [
                for (int count = 1; count <= 2; count++)
                  ContactCard(
                    Contact(
                      '010-2717-4353',
                      User('이예찬 $count')
                    ),
                    height: height * 0.065
                  )
              ]
            )
          ]
        )
      )
    );
  }
}