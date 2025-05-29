import 'package:flutter/material.dart';

class RoomTabModel {
  final String _tabText;
  final IconData _icon;

  RoomTabModel({required String tabText, required IconData icon})
      : _tabText = tabText,
        _icon = icon;

  String get tabText => _tabText;
  IconData get icon => _icon;
}