// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for using json.decode()
import '../pages/single_item.dart';
import '../globals.dart' as globals;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items = [];

  Future<void> _fetchData() async {
    const API_URL = 'https://be-tooled.herokuapp.com/api/items';

    final response = await http.get(Uri.parse(API_URL));
    final data = json.decode(response.body);

    setState(() {
      items = data['items'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('T O O L E D'),
        ),
        body: Container(
          child: Card(
            child: FutureBuilder(
                future: _fetchData(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SingleItem(data: items[index]),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(20),
                            height: 300,
                            child: Stack(children: [
                              Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    items[index]["item_image"],
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
                                    items[index]["name"] +
                                        ' £' +
                                        items[index]["price"].toString(),
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                trailing: Icon(
                                  globals.faveList.contains(items[index])
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                  semanticLabel:
                                      globals.faveList.contains(items[index])
                                          ? 'Remove from saved'
                                          : 'Save',
                                ),
                                onTap: () {
                                  setState(() {
                                    if (globals.faveList
                                        .contains(items[index])) {
                                      globals.faveList.remove(items[index]);
                                    } else {
                                      globals.faveList.add(items[index]);
                                    }
                                  });
                                },
                              ),
                            ]),
                          ),
                        );
                      });
                }),
          ),
        ));
  }
}
