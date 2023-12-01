import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final double height;
  final double fontsize;
  final double elevation;
  final Function func;

  const CustomButton({
    required this.func,
    required this.text,
    required this.elevation,
    required this.color,
    required this.width,
    required this.height,
    required this.fontsize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: this.elevation,
      color: color,
      borderRadius: BorderRadius.circular(40),
      child: MaterialButton(
        onPressed: () {
          func();
        },
        elevation: 100,
        minWidth: this.width,
        height: this.height,
        padding: EdgeInsets.all(16),
        child: Text(
          this.text,
          style: TextStyle(fontSize: this.fontsize),
        ),
      ),
    );
  }
}
