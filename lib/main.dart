import 'package:bring/screen/Verification.dart';
import 'package:bring/screen/Welcomescreen.dart';
import 'package:bring/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'server/socketserver.dart';

late SocketService socketService;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: {
        'splashscreen': (context) => SplashScreen(),
        'Verification': (context) => Login(),
        'welcomescreen': (context) => welcomescreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    socketService = SocketService('10.0.0.44:3000');
    socketService.connect();
    socketService.listenForMessages((data) {
      print('Message from the node server: $data');
    });
  }

  @override
  void dispose() {
    socketService.disconnect();
    super.dispose();
  }

  void sendMessage(dynamic message, String decr) {
    socketService.sendMessage(message, decr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
            welcomescreen() /*Stack(
          children: [
            SplashScreen(),
            totalprice(),
          ],
        )*/
        );
  }
}
