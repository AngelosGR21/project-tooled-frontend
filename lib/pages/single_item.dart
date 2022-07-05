// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../models/item.dart';

class SingleItem extends StatelessWidget {
  final Item items;
  const SingleItem({Key? key, required this.items}) : super(key: key);

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
                  items.itemImage,
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
            height: 100,
            child: TabBarView(children: [
              Padding(
                padding: const EdgeInsets.all(15),
                // child: Center(child: Text('hello')),
              ),
              Text('Review'),
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
                      '£10 Message seller',
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
