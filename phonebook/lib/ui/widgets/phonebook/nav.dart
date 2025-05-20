import 'package:flutter/material.dart';
import 'package:phonebook/ui/widgets/phonebook/more_vertical.dart';

class PhoneNavWidget extends StatelessWidget {
  final int navFlex;
  final List<IconData> icons;

  const PhoneNavWidget({super.key, required this.navFlex, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: navFlex,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        // children: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.add, color: Colors.white, size: 30),
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.search, color: Colors.white, size: 30),
        //   ),
        //   MoreVerticalWidget(),
        // ],
          children: List<Widget>.generate(icons.length, (index) => IconButton(onPressed: () {}, icon: Icon(icons[index]))).toList()
      ),
    );
  }
}