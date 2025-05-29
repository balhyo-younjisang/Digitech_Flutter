import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:smarthome/ui/view/home/tab_view.dart';
import 'package:smarthome/ui/view/routines/tab_view.dart';
import 'package:smarthome/ui/widget/common/size_widget.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.only(right: 24),
      leading: Padding(
        padding: EdgeInsets.only(left: 14),
        child: IconButton(onPressed: () {}, icon: Icon(Icons.sort_outlined)),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  final bodyWidgets = const <Widget>[
    FullSizeBox(child: HomeTab()),
    FullSizeBox(child: RoutinesTab()),
    FullSizeBox(child: ColoredBox(color: Colors.yellow)),
  ];

  @override
  State<StatefulWidget> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  late int _selectedIndex;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _selectedIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(243, 244, 245, 1),
        appBar: HeaderAppBar(),
        body: PageView(
          controller: this._pageController,
          onPageChanged: _updateSelectedIndex,
          children: widget.bodyWidgets,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          unselectedItemColor: Colors.black.withAlpha(40),
          iconSize: 28,
          unselectedLabelStyle: TextStyle(color: Colors.white.withAlpha(40)),
          backgroundColor: Colors.white,
          onTap: (selectedIndex) {
            setState(() {
              _updateSelectedIndex(selectedIndex, () {
                _pageController.animateToPage(
                  _selectedIndex,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
              });
            });
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Symbols.home_rounded), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Symbols.routine_rounded),
              label: "Routines",
            ),
            BottomNavigationBarItem(icon: Icon(Symbols.monitoring_rounded), label: "Report"),
          ],
        ),
      ),
    );
  }

  void _updateSelectedIndex(
    final int selectedIndex, [
    final VoidCallback? callback,
  ]) {
    setState(() {
      this._selectedIndex = selectedIndex;
      callback?.call();
    });
  }
}
