import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Chats",
          style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: Container(),
    );
  }
}
