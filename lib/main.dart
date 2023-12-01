import 'package:flutter/material.dart';
import 'server/socketserver.dart';
import 'screen/homescreen.dart';
import 'screen/messagescreen.dart';

late SocketService socketService;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      routes: {
        'homescreen': (context) => homescreen(),
        'messagescreen': (context) => messagescreen(),
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
    socketService = SocketService('192.168.14.9:3000');
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

  void sendMessage(dynamic message) {
    socketService.sendMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Color.fromRGBO(254, 114, 36, 1),
      ),
      body: homescreen(),
    );
  }
}