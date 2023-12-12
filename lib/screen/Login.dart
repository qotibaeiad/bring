import 'dart:ffi';
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
                      ContainerLogin(),
                      SizedBox(width: 13),
                      ContainerLogin(),
                      SizedBox(width: 13),
                      ContainerLogin(),
                      SizedBox(width: 13),
                      ContainerLogin(),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Text(
                      'Resend the code?',
                      style: TextStyle(color: Colors.blue[500]),
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
          )
        ],
      ),
    );
  }

  Container ContainerLogin() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Set the border radius
        border: Border.all(color: Colors.grey), // Set the border color
      ),
      width: 50,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none, // Remove the default TextField border
        ),
      ),
    );
  }
}
