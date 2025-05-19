import 'package:flutter/material.dart';
import 'package:phonebook/domain/phone.dart';
import 'package:phonebook/ui/widgets/phonebook/profile.dart';
import 'package:phonebook/ui/widgets/phonebook/profile_nav.dart';

class PhoneWidget extends StatefulWidget {
  final PhoneDummy phoneData;

  const PhoneWidget({super.key, required this.phoneData});

  @override
  State<StatefulWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
        width: double.infinity,
        height: isOpen ? 170 : 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            isOpen ? Radius.circular(20) : Radius.circular(40),
          ),
          color: Colors.blueGrey.withAlpha(100),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          radius: 0,
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 20,
                    children: [
                      ProfileWidget(),
                      Text(
                        widget.phoneData.name,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  isOpen
                      ? ProfileNavWidget(phone: widget.phoneData.phone)
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
