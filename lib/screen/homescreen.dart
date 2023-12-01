import 'package:bring/class/user.dart';
import 'package:bring/main.dart';
import 'package:bring/widget/custom_Button.dart';
import 'package:bring/widget/custom_Container.dart';
import 'package:bring/widget/custom_TextField.dart';
import 'package:flutter/material.dart';

late String name;
late String phonenumber;

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
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
                  customTextfield(
                    padding: 1,
                    height: 50,
                    width: 250,
                    hintText: 'Name',
                    border: 20,
                    onChanged: (value) {
                      setState(() {
                        name = value; // Update the name in the state
                      });
                    },
                  ),
                  customTextfield(
                    padding: 1,
                    height: 50,
                    width: 250,
                    hintText: 'Phone Number',
                    border: 20,
                    onChanged: (value) {
                      setState(() {
                        phonenumber = value; // Update the name in the state
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        func: () {
                          final User user = User();
                          user.setUserData(name, phonenumber);
                          socketService.sendMessage('addUser', user);
                          // socketService.sendMessage("Login");
                          Navigator.pushNamed(context, 'messagescreen');
                        },
                        text: 'Login',
                        elevation: 4,
                        color: Color.fromRGBO(254, 114, 36, 1),
                        width: 100,
                        height: 30,
                        fontsize: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomButton(
                        func: () {
                          // socketService.sendMessage("Sigin");
                        },
                        text: 'Sigin',
                        elevation: 4,
                        color: Color.fromRGBO(142, 202, 193, 1),
                        width: 100,
                        height: 30,
                        fontsize: 20,
                      ),
                    ],
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
