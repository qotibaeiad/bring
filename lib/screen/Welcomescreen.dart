import 'package:flutter/material.dart';

class welcomescreen extends StatefulWidget {
  const welcomescreen({Key? key}) : super(key: key);

  @override
  State<welcomescreen> createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 20)]),
          child: Image.asset(
            'images/Login.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 450, bottom: 30, left: 20, right: 20),
          child: Container(
            width: 500,
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [BoxShadow(blurRadius: 8, spreadRadius: 0.8)],
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Enter your phone number',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      child: Text('good'),
                    )),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: MaterialButton(
                    onPressed: (() => {}),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(90),
                        boxShadow: [BoxShadow(blurRadius: 6, spreadRadius: 1)],
                      ),
                      child: Icon(
                        Icons.send,
                        color: Colors.black87,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

/*
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }
  */
}
