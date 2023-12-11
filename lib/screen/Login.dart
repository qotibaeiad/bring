import 'package:bring/screen/homescreen.dart';
import 'package:bring/widget/custom_TextField.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0.7,
                      blurRadius: 4,
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person,
                  size: 100,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    customTextfield(
                      padding: 20,
                      height: 90,
                      width: 300,
                      hintText: "Phone Number",
                      border: 23,
                      onChanged: (value) {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
