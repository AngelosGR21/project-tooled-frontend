// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Listing extends StatefulWidget {
  const Listing({Key? key}) : super(key: key);

  @override
  State<Listing> createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Listing',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
