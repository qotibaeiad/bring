import 'dart:math';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                elevation: 10,
                child: Container(
                  child: Image.asset(
                    'images/logo1.jpg',
                  ),
                ),
              ),
              Column(
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
                      color: Colors.grey[700],
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(bottom: 300),
                    child: Column(
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10) // Adjust the radius as needed
                              ),
                          elevation: 7,
                          onPressed: () {},
                          color: Colors.white,
                          child: Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
