import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/ProfileCircle.dart';

class Profile2Widget extends StatefulWidget {
  const Profile2Widget({super.key});

  final double width = 320;
  final double height = 600;

  @override
  State<StatefulWidget> createState() => Profile2WidgetState();
}

class Profile2WidgetState extends State<Profile2Widget> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.black26, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(100),
            spreadRadius: 0.0,
            blurRadius: 15.0,
            offset: Offset(0.5, 0.7),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Icon(Icons.female, color: Colors.black26, size: 30)],
            ),
            Row(children: [ProfileCircle()]),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    "Ano",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.cyan,
                      fontFamily: "Ubuntu",
                    ),
                  ),
                  Text(
                    "Japanese Singer",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 18,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          strutStyle: StrutStyle(fontSize: 16.0),
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontFamily: "Ubuntu",
                            ),
                            text:
                                "Ano (あの, born September 4) is a Japanese singer, songwriter, actress, presenter, and model.",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            Row(
              spacing: 20,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "55.6M",
                      style: TextStyle(fontFamily: "Ubuntu", fontSize: 24),
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 18,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "3,048",
                      style: TextStyle(fontFamily: "Ubuntu", fontSize: 24),
                    ),
                    Text(
                      "Following",
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 18,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isFollowing = !isFollowing;
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  backgroundColor:
                      isFollowing ? Colors.transparent : Colors.lightBlue,
                ),
                child: Text(
                  isFollowing ? "Unfollow" : 'Follow',
                  style: TextStyle(
                    fontFamily: "ubuntu",
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
