import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/ImageLogo.dart';
import 'package:flutter_example/widgets/ProfileCircle.dart';

class Profile1Widget extends StatelessWidget {
  const Profile1Widget({super.key});

  final double width = 320;
  final double height = 600;
  final double headerFlex = 0.1;
  final double profileFlex = 0.3;
  final double navFlex = 0.2;
  final double contentFlex = 0.4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black26, width: 1),
        boxShadow: [BoxShadow(
          color: Colors.grey.withAlpha(100),
          spreadRadius: 0.0,
          blurRadius: 15.0,
          offset: Offset(0.5, 0.7),
          blurStyle: BlurStyle.outer
        )]
      ),
      child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, color: Colors.black26),
                ),
              ],
            ),
            Column(
              children: [
                Stack(
                  children: [
                   ProfileCircle(),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Icon(
                        Icons.check_circle_rounded,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  children: [
                    Text(
                      "Ano",
                      style: TextStyle(fontSize: 32),
                    ),
                    Text(
                      "Japanese Singer",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Follower",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      "60.6M",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Listener",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      "54.4M",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Songs",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      "99+",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                    child: RichText(
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      strutStyle: StrutStyle(fontSize: 16.0),
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        text:
                            "Ano (あの, born September 4) is a Japanese singer, songwriter, actress, presenter, and model.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                ImageLogoWidget(imagePath: "assets/images/x_logo.png"),
                ImageLogoWidget(imagePath: "assets/images/instagram_logo.webp"),
                ImageLogoWidget(imagePath: "assets/images/facebook_logo.png"),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: this.width * 0.8,
              height: 60,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(100),
                    blurRadius: 15.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.7, 0.7)
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                ),
                child: Text("View Profile", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
    );
  }
}
