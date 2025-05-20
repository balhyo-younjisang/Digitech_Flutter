import 'package:flutter/material.dart';
import 'package:phonebook/ui/widgets/IconButton.dart';
import '../IconCircle.dart';

class ProfileNavWidget extends StatelessWidget {
  final String phone;

  const ProfileNavWidget({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "전화번호 $phone",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButtonWidget(
                  icon: Icons.wifi_calling,
                  backgroundColor: Colors.lightGreen,
                  iconColor: Colors.white,
                ),
                IconButtonWidget(
                  icon: Icons.message_rounded,
                  backgroundColor: Colors.blueAccent,
                  iconColor: Colors.white,
                ),
                IconButtonWidget(
                  icon: Icons.video_call_rounded,
                  backgroundColor: Colors.lightGreen,
                  iconColor: Colors.white,
                ),
                IconButtonWidget(
                  icon: Icons.info,
                  backgroundColor: Colors.teal,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
