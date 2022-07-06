// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import "../Utils/ws.dart";

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  String _message = "";
  // print(globals.token);
  // print(msg);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Center(
          widthFactor: 30,
          child: TextField(
            onChanged: (e) => _message = e,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              if (_message.isNotEmpty) {
                sendMessage(_message);
              }
            },
            child: Text("Send message"))
      ],
    ));
  }
}
