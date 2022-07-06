// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert'; // for using json.decode()
// import '../pages/single_item.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,
//       title: 'Kindacode.com',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // The list that contains information about photos
//   List items = [];

//   // The function that fetches data from the API
//   Future<void> _fetchData() async {
//     const API_URL = 'https://be-tooled.herokuapp.com/api/items';

//     final response = await http.get(Uri.parse(API_URL));
//     final data = json.decode(response.body);
//     print(data['items']);

//     setState(() {
//       items = data['items'];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text('T O O L E D'),
//       ),
//       body: SafeArea(
//           child: items.length == 0
//               ? Center(
//                   child: ElevatedButton(
//                     child: Text(
//                       'Load Items',
//                     ),
//                     onPressed: _fetchData,
//                   ),
//                 )
//               // The ListView that displays photos
//               : ListView.builder(
//                   itemCount: items.length,
//                   itemBuilder: (BuildContext ctx, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 SingleItem(data: items[index]),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         margin: EdgeInsets.all(20),
//                         height: 300,
//                         child: Stack(children: [
//                           Positioned.fill(
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: Image.network(
//                                 items[index]["item_image"],
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 60,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(20),
//                                   topRight: Radius.circular(20)),
//                               gradient: LinearGradient(
//                                 begin: Alignment.bottomLeft,
//                                 end: Alignment.bottomRight,
//                                 colors: [
//                                   Colors.black.withOpacity(0.7),
//                                   Colors.black.withOpacity(0.7),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   items[index]["name"],
//                                   style: TextStyle(
//                                     color: Colors.white.withOpacity(0.7),
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 '£' + items[index]["price"].toString(),
//                                 style: TextStyle(
//                                   color: Colors.white.withOpacity(0.7),
//                                   fontSize: 20,
//                                 ),
//                               )
//                             ],
//                           )
//                         ]),
//                       ),
//                     );
//                   })),
//     );
//   }
// }
