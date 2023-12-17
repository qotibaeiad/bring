import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  late FocusNode currentFocusNode;

  @override
  void initState() {
    super.initState();
    currentFocusNode = focusNodes[0];
  }

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
                          style: getTextStyle(focusNodes[0]),
                        ),
                        Text(
                          'verify your',
                          style: getTextStyle(focusNodes[1]),
                        ),
                        Text(
                          'account',
                          style: getTextStyle(focusNodes[2]),
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
                              color: Colors.white),
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
                            ContainerLogin(focusNode: focusNodes[0], index: 0),
                            SizedBox(width: 13),
                            ContainerLogin(focusNode: focusNodes[1], index: 1),
                            SizedBox(width: 13),
                            ContainerLogin(focusNode: focusNodes[2], index: 2),
                            SizedBox(width: 13),
                            ContainerLogin(focusNode: focusNodes[3], index: 3),
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
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //
                        Center(
                          child: MaterialButton(
                            onPressed: (() =>
                                {Navigator.pushNamed(context, 'splashscreen')}),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.blue[900],
                                borderRadius: BorderRadius.circular(90),
                                boxShadow: [
                                  BoxShadow(blurRadius: 6, spreadRadius: 1)
                                ],
                              ),
                              child: Center(
                                  child: Text(
                                'Send',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
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

  Container ContainerLogin({required FocusNode focusNode, required int index}) {
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
        color: focusNode.hasFocus
            ? Colors.blue[100]
            : Colors.white, // Change color when focused
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            if (hasFocus) {
              currentFocusNode = focusNode;
            }
          });
        },
        child: TextField(
          cursorColor: Colors.white,
          focusNode: focusNode,
          onChanged: (value) {
            if (value.isNotEmpty) {
              moveFocus(focusNode, index);
            } else {
              moveFocusBackward(focusNode, index);
            }
          },
          style: TextStyle(
            color: Colors.black,
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
      ),
    );
  }

  TextStyle getTextStyle(FocusNode focusNode) {
    return TextStyle(
      color: focusNode.hasFocus ? Colors.blue[900] : Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
  }

  void moveFocus(FocusNode focusNode, int index) {
    int currentIndex = focusNodes.indexOf(focusNode);
    if (currentIndex < focusNodes.length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[currentIndex + 1]);
    }
  }

  void moveFocusBackward(FocusNode focusNode, int index) {
    int currentIndex = focusNodes.indexOf(focusNode);
    if (currentIndex > 0) {
      FocusScope.of(context).requestFocus(focusNodes[currentIndex - 1]);
    }
  }
}
