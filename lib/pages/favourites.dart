// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../pages/home1.dart';
import '../globals.dart' as globals;

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('T O O L E D'),
      ),
      body: ListView.builder(
          itemCount: globals.faveList.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              margin: EdgeInsets.all(20),
              height: 300,
              child: Stack(children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      globals.faveList[index]["item_image"],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      globals.faveList[index]["name"] +
                          ' £' +
                          globals.faveList[index]["price"].toString(),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ]),
            );
          }),
    );
  }
}
