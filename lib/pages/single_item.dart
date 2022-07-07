import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class SingleItem extends StatefulWidget {
  final dynamic data;
  SingleItem({Key? key, this.data}) : super(key: key);
  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  Card buildCard() {
    var heading = 'mark123';
    var subheading = '7 July 2022 10:01am';
    var supportingText = 'Really nice car to ride';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(heading),
              subtitle: Text(subheading),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              alignment: Alignment.centerLeft,
              child: Text(supportingText),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'T O O L E D',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 250,
              margin: EdgeInsets.all(15),
              child: Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.data['item_image'],
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
                  Tab(text: 'Comments'),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 310,
              child: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: Text(widget.data['body']),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 30.0),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: ElevatedButton(
                              child: Text("Test call"),
                              onPressed: () async {
                                FlutterPhoneDirectCaller.callNumber(
                                    "085921191121");
                              },
                            ),
                            // child: Text(
                            //   '£' +
                            //       widget.data['price'].toString() +
                            //       ' Message seller 077712210301',
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.bold),
                            // ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          buildCard(),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
