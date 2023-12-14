import 'dart:ffi';
import 'dart:math';

import 'package:bring/screen/homescreen.dart';
import 'package:bring/widget/custom_TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 130, left: 30, right: 30, bottom: 110),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [BoxShadow(blurRadius: 5)]),
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Let\'s',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]),
                        ),
                        Text(
                          'verify your',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]),
                        ),
                        Text(
                          'account',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]),
                        ),
                        Container(
                          child: Image.asset(
                            './images/vervifcation.jpg',
                            fit: BoxFit.cover,
                          ),
                          height: 300,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: Colors.black),
                        ),
                        Text('We\'ll send a code to your',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54)),
                        Text('Phone number',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54)),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContainerLogin(focusNode: focusNodes[0]),
                            SizedBox(width: 13),
                            ContainerLogin(focusNode: focusNodes[1]),
                            SizedBox(width: 13),
                            ContainerLogin(focusNode: focusNodes[2]),
                            SizedBox(width: 13),
                            ContainerLogin(focusNode: focusNodes[3]),
                          ],
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 115, top: 10),
                            child: Text(
                              'Resend the code?',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue[700],
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(blurRadius: 9)],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.login_outlined,
                              size: 30,
                              color: Colors.blue[900],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container ContainerLogin({required FocusNode focusNode}) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            spreadRadius: 0.2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        cursorColor: Colors.white,
        focusNode: focusNode,
        onChanged: (value) {
          if (value.isNotEmpty) {
            moveFocus(focusNode);
          }
        },
        style: TextStyle(
          color: Colors.white,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "",
        ),
      ),
    );
  }

  void moveFocus(FocusNode focusNode) {
    int currentIndex = focusNodes.indexOf(focusNode);
    if (currentIndex < focusNodes.length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[currentIndex + 1]);
    }
  }
}
