import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:phonebook/domain/phone.dart';
import 'package:phonebook/ui/widgets/IconCircle.dart';
import 'package:phonebook/ui/widgets/phonebook/profile_nav.dart';
import 'package:phonebook/utils/Color.dart';
import 'package:phonebook/utils/Icon.dart';

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
  State<StatefulWidget> createState() => _PhoneContentWidgetState();
}

class _PhoneContentWidgetState extends State<PhoneContentWidget> {
  final ExpansionTileController controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 5), () {
      controller.expand();
    });

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
                  child: ExpansionTile(
                    controller: controller,
                    iconColor: Colors.blueGrey.withAlpha(40),
                    backgroundColor: Colors.blueGrey.withAlpha(40),
                    collapsedBackgroundColor: Colors.blueGrey.withAlpha(40),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 20,
                      children: [
                        IconCircleWidget(
                          iconColor: ColorUtil.buildPrefixColor(
                            PhoneStatus.profile,
                          ),
                          icon: IconUtil.buildPrefix(PhoneStatus.profile),
                          gradient: widget.gradient,
                        ),
                        Flexible(
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: phone.displayName ?? "알 수 없음",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    children: [
                      ProfileNavWidget(
                        phone:
                            phone.phones.isNotEmpty
                                ? phone.phones.first.number
                                : "알 수 없음",
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
