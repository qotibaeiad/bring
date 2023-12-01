import 'package:bring/widget/custom_Button.dart';
import 'package:bring/widget/custom_Container.dart';
import 'package:flutter/material.dart';
import 'package:bring/main.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            customContainer(
                path: 'images/logo.png',
                radius: 20,
                elevation: 4,
                width: 250,
                height: 250),
            SizedBox(
              height: 100,
            ),
            Column(
              children: [
                CustomButton(
                  func: () {
                    socketService.sendMessage("Login");
                    Navigator.pushNamed(context, 'messagescreen');
                  },
                  text: 'Login',
                  elevation: 4,
                  color: Color.fromRGBO(254, 114, 36, 1),
                  width: 250,
                  height: 30,
                  fontsize: 20,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                  func: () {
                    socketService.sendMessage("Sigin");
                  },
                  text: 'Sigin',
                  elevation: 4,
                  color: Color.fromRGBO(142, 202, 193, 1),
                  width: 250,
                  height: 30,
                  fontsize: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
