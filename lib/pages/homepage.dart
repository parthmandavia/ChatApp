import 'package:flutter/material.dart';
import 'package:chat_app/pages/chatscreen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ChatScreen(),
    );
  }
}
