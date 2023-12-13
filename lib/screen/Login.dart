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
      backgroundColor: Colors.blue[900],
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.black45),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://photographer.paulewilliams.com/img-get2/I0000KOB2xgu0Re0/fit=1000x750/g=G0000DfCioCaOdiU/11598-Burger-In-Bun-Photos.jpg"),
                    ),

                    // color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(blurRadius: 7)]),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 39),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(blurRadius: 9)],
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            'Bring',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blue[900]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Text(
                      'Resend the code?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
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
                ],
              )
            ],
          ),
        ],
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
