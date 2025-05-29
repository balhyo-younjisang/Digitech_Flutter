import 'package:flutter/material.dart';
import 'package:smarthome/ui/view/home/tab_view.dart';

class RoomTabNavWidget extends StatelessWidget {
  const RoomTabNavWidget({
    super.key,
    required this.tabText,
    required this.icon,
    required this.index,
  });
  final String tabText;
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool isSelected =
        context.findRootAncestorStateOfType<HomeTabState>()!.selectedIndex == index;

    return Tab(
      height: 120,
      child: Column(
        children: [
          SizedBox(
            width: 76,
            height: 76,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isSelected
                    ? Color.fromRGBO(18, 40, 61, 1)
                    : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Icon(
                icon,
                size: 58,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
          Text(
            tabText,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
