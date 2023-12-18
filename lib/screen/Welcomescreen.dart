import 'package:bring/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class welcomescreen extends StatefulWidget {
  const welcomescreen({Key? key}) : super(key: key);

  @override
  State<welcomescreen> createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IL';
  PhoneNumber number = PhoneNumber(isoCode: 'IL');
  late String Num;
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
            padding: EdgeInsets.only(top: 40),
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
                Center(
                  child: Text(
                    'Enter your Phone Number:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Colors.blue[900]),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'We will send you 4 digit verification code',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      Num = number.phoneNumber!;
                      print(number.phoneNumber);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    selectorConfig: SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: TextStyle(color: Colors.black),
                    initialValue:
                        PhoneNumber(isoCode: 'IL'), // Set the initial country
                    textFieldController: TextEditingController(),
                    inputDecoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: MaterialButton(
                    // Client side (Flutter app)
                    onPressed: () {
                      // Convert PhoneNumber instance to Map<String, dynamic> before sending

                      // Emit the Map instead of the PhoneNumber instance

                      socketService.socket.emit("phonenumber", Num);
                      Navigator.pushNamed(context, 'Verification');
                    },

                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(90),
                        boxShadow: [BoxShadow(blurRadius: 6, spreadRadius: 1)],
                      ),
                      child: Center(
                          child: Text(
                        'Send',
                        style: TextStyle(color: Colors.white),
                      )),
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

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }
}
