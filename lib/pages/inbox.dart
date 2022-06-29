// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Inbox',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
