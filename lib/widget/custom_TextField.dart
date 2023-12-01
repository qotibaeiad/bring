import 'package:flutter/material.dart';

class customTextfield extends StatelessWidget {
  final double width;
  final double height;
  final String hintext;
  final double padding;
  const customTextfield(
      {required this.padding,
      required this.height,
      required this.width,
      required this.hintext,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: Padding(
        padding: EdgeInsets.all(this.padding),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: this.hintext,
            isDense:
                true, // Set to true to reduce the height of the input field
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
