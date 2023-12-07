import 'package:flutter/material.dart';

class customContainer extends StatelessWidget {
  final String path;
  final double elevation;
  final double width;
  final double height;
  final double radius;
  const customContainer(
      {required this.path,
      required this.radius,
      required this.elevation,
      required this.width,
      required this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.radius),
        ),
        child: ClipOval(
          child: Image.network(
            "https://i.postimg.cc/B66nPWz3/5.png",
            width: this.width,
            height: this.height,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
