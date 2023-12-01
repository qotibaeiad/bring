import 'package:flutter/material.dart';
import 'package:bring/widget/Listchats.dart'; // Import the listchat class

List<listchat> chatItems = [];

class messagescreen extends StatefulWidget {
  const messagescreen({Key? key}) : super(key: key);

  @override
  State<messagescreen> createState() => _messagescreenState();
}

class _messagescreenState extends State<messagescreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Chat'),
          backgroundColor: Color.fromRGBO(254, 114, 36, 1),
        ),
        body: ListView(
          children: _buildChatList(),
        ),
      ),
    );
  }

  List<listchat> _buildChatList() {
    chatItems.add(
      listchat(
        mainText: 'New Chat',
        Lasticon: 'person',
        firsticon: 'person',
      ),
    );
    return chatItems.map((item) => item).toList();
  }
}
