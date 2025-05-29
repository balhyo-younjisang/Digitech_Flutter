import 'package:flutter/material.dart';
import 'package:smarthome/ui/widget/size_widget.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  final bodyWidgets = const <Widget>[
    FullSizeBox(child: ColoredBox(color: Colors.red)),
    FullSizeBox(child: ColoredBox(color: Colors.green)),
    FullSizeBox(child: ColoredBox(color: Colors.yellow)),
  ];

  @override
  State<StatefulWidget> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort_outlined),
            ),
            actions: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  "https://www.shutterstock.com/image-photo/smiling-african-american-millennial-businessman-600nw-1437938108.jpg",
                  fit: BoxFit.cover,
                  isAntiAlias: true,
                ),
              ),
            ],
          ),
          body: this.widget.bodyWidgets[this._selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            onTap: (selectedIndex) {
              setState(() {
                _selectedIndex = selectedIndex;
              });
            },
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.alarm_on), label: "Routines"),
              BottomNavigationBarItem(icon: Icon(Icons.report), label: "Report"),
            ],
          ),
        ),
      ),
    );
  }
}
