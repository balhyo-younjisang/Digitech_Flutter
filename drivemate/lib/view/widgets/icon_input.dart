import 'package:flutter/material.dart';

class IconInput extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final String label;
  final bool isSecure;

  const IconInput({
    super.key,
    required this.controller,
    required this.icon,
    required this.label,
    this.isSecure = false,
  });

  @override
  State<StatefulWidget> createState() => _IconInputState();
}

class _IconInputState extends State<IconInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: Colors.grey),
        labelText: widget.label,
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5)
        )
      ),
      obscureText: widget.isSecure,
    );
  }
}
