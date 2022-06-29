// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favourites',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
