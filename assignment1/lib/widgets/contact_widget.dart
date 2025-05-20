import 'package:assignment1/model/contact.dart';
import 'package:assignment1/types/global.dart';
import 'package:assignment1/utils/variable_util.dart';
import 'package:assignment1/views/contact_list.dart';
import 'package:assignment1/widgets/profile_widget.dart';
import 'package:assignment1/widgets/box_widget.dart';
import 'package:assignment1/widgets/tab_widget.dart';
import 'package:flutter/material.dart';

var _backgroundColor = Color.fromRGBO(62, 62, 62, 1.0);

class ContactCard extends StatelessWidget {
  final Contact contact;
  final double height;
  final double width;

  const ContactCard(
    this.contact, {
    super.key,
    required this.height,
    double? width
  }) : this.width = width ?? double.infinity;

  @override
  Widget build(final BuildContext context) {
    final double fontSize = this.height * 0.35;
    final String userName = this.contact.user.name;

    return WideBox(
      height: this.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: _backgroundColor
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            spacing: 15,
            children: [
              ProfilePicture.circle(),
              Text(
                userName,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600
                )
              )
            ]
          )
        )
      )
    );
  }
}

class ContactBar extends StatelessWidget {
  final Widgets _actions;

  const ContactBar({
    super.key,
    Widgets actions = Lists.emptyWidgets
  }) : this._actions = actions;

  @override
  Widget build(final BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              '전화',
              style: TextStyle(
                fontSize: height * 0.05
              )
            )
          )
        ),
        WideBox(
          height: height * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: this._actions,
          )
        )
      ]
    );
  }
}

class ContactWrapper extends StatelessWidget {
  const ContactWrapper({super.key});

  @override
  Widget build(final BuildContext context) {
    return BottomTab(
      tabs: [
        Tab(text: '키패드'),
        Tab(text: '최근기록'),
        Tab(text: '연락처')
      ],
      widgets: [
        SizedBox(),
        SizedBox(),
        ContactListView()
      ]
    );
  }

}