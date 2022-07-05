// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../models/item.dart';

class SingleItem extends StatelessWidget {
  final dynamic data;
  const SingleItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'T O O L E D',
          ),
        ),
        body: Column(children: [
          Container(
            height: 250,
            margin: EdgeInsets.all(15),
            child: Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  data['item_image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: 'Description'),
                Tab(text: 'Reviews'),
                Tab(text: 'Price'),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 200,
            child: TabBarView(children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(child: Text(data['body'])),
              ),
              Container(child: Center(child: Text(data['rating'].toString()))),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 70.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '£' + data['price'].toString() + ' Message seller',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
