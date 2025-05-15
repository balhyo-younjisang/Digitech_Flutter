import 'package:flutter/material.dart';

final borderColor = Color.fromARGB(255, 219, 219, 219);
final double borderWidth = 1;

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    this.assetFlex = 0.45,
    this.contentFlex = 0.3,
    this.headerFlex = 0.15,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.profilePath
  });
  // final int assetFlex;
  // final int contentFlex;
  // final int headerFlex;
  final double assetFlex;
  final double contentFlex;
  final double headerFlex;
  final double width;
  final double height;
  final String imagePath;
  final String profilePath;
  // const CardWidget({
  //   super.key,
  //   required this.width,
  //   required this.height,
  //   this.headerFlex = 2,
  //   this.assetFlex = 5,
  //   this.contentFlex = 4,
  // });

  @override
  State<StatefulWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  // IconData _favorite = Icons.favorite_border;
  // IconData _bookmarked = Icons.bookmark_add_outlined;
  bool isLike = false;
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Column(
          children: [
            Container(
              height: widget.height * widget.headerFlex,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: borderColor, width: borderWidth),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(widget.profilePath),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              spacing: 3,
                              children: [
                                Text(
                                  "Ano",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontFamily: "Ubuntu",
                                  ),
                                ),
                                Text(
                                  "@ano_official",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontFamily: "Ubuntu",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 3,
                              children: [
                                Icon(Icons.location_city, size: 12),
                                Text(
                                  "Japan, Tokyo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    fontFamily: "Ubuntu",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    PopupMenuButton(
                      itemBuilder:
                          (context) => <PopupMenuEntry>[
                            PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.people_alt_outlined),
                                title: Text("Follow"),
                              ),
                            ),
                            PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.account_circle_outlined),
                                title: Text("Account"),
                              ),
                            ),
                            PopupMenuDivider(),
                            PopupMenuItem(
                              child: ListTile(
                                leading: Icon(Icons.not_interested),
                                title: Text("Block"),
                              ),
                            ),
                          ],
                      icon: Icon(Icons.more_vert),
                      popUpAnimationStyle: AnimationStyle(
                        duration: const Duration(milliseconds: 250),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: widget.height * widget.assetFlex,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: borderColor, width: borderWidth),
                ),
              ),
              // background: url('이미지 경로') cover;
              child: Image(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              height: widget.height * widget.contentFlex - 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isLike = !isLike;
                                // _favorite =
                                // isLike
                                //         ? Icons.favorite
                                //         : Icons.favorite_border;
                              });
                            },
                            isSelected: isLike,
                            icon: Icon(
                              Icons.favorite_border,
                            ),
                            selectedIcon: Icon(Icons.favorite, color: Colors.redAccent,),
                          ),
                          Text(
                            "5.6M",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontFamily: "Ubuntu",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isBookmarked = !isBookmarked;
                                // _bookmarked =
                                // isBookmarked
                                //         ? Icons.bookmark_add
                                //         : Icons.bookmark_add_outlined;
                              });
                            },
                            isSelected: isBookmarked,
                            icon: Icon(Icons.bookmark_add_outlined, color: Colors.black54),
                            selectedIcon: Icon(Icons.bookmark_add),
                          ),
                          Text(
                            "10.8M",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontFamily: "Ubuntu",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 300,
                    height: 80,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              strutStyle: StrutStyle(fontSize: 16.0),
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Ubuntu",
                                ),
                                text:
                                    "Ano (あの, born September 4) is a Japanese singer, songwriter, actress, presenter, and model.",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "SHARE",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "COMMENT",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
