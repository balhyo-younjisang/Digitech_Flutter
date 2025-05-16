import 'dart:math';

import 'package:flutter/material.dart';

var random = Random();

class ColorGenerator {
  static Color randomColor() {
    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }
}

class TileWidget extends StatefulWidget {
  const TileWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TileState();
}

class _TileState extends State<TileWidget> {
  final List<Widget> _tiles = <ColorTileWidget>[
    ColorTileWidget(key: UniqueKey(),),
    ColorTileWidget(key: UniqueKey(),),
  ];

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(itemCount: _tiles.length, itemBuilder: (context, index) => _tiles[index]);
    return Scaffold(
      body: Row(children: _tiles),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Widget widget = _tiles.removeAt(0);

            _tiles.insert(1, widget);
          });
        },
        child: Icon(Icons.change_circle_rounded),
      ),
    );
  }
}

class ColorTileWidget extends StatefulWidget {
  const ColorTileWidget({super.key});

  @override
  State<StatefulWidget> createState() => ColorTileState();
}

class ColorTileState extends State<ColorTileWidget> {
  final Color _color = ColorGenerator.randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(color: _color, width: 70, height: 70);
  }
}
