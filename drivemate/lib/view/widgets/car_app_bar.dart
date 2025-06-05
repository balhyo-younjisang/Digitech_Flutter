import 'package:flutter/material.dart';

class CarAppBar extends StatelessWidget {
  final String carName;
  final String? title;
  const CarAppBar({super.key, required this.carName, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                carName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.black),
            ],
          ),
        ),
        title != null ? Text(title!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),) : SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            SizedBox(
              width: 40,
              height: 30,
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      size: 28,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      width: 12,
                      height: 12,
                      child: Center(
                        child: Text(
                          "N",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings_outlined,
                  size: 28,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}