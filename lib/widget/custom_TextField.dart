import 'package:flutter/material.dart';

class customTextfield extends StatelessWidget {
  final double width;
  final double height;
  final String hintText;
  final double padding;
  final double border;
  final Function(String) onChanged; // Callback function

  const customTextfield({
    required this.padding,
    required this.height,
    required this.width,
    required this.hintText,
    required this.border,
    required this.onChanged, // Pass the callback function
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: TextField(
          onChanged: onChanged, // Trigger the callback function on change
          decoration: InputDecoration(
            hintText: hintText,
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(this.border), // Set circular border
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
