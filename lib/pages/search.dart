// // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:tooled/pages/single_item.dart';
// import '../models/item.dart';
// import '../Utils/utils.dart';
// import '../pages/single_item.dart';

// class Search extends StatefulWidget {
//   const Search({Key? key}) : super(key: key);

//   @override
//   State<Search> createState() => _SearchState();
// }

// List<Items> items = utils.getMockedItems();

// class _SearchState extends State<Search> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: Text('T O O L E D'),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   showSearch(
//                     context: context,
//                     delegate: CustomSearchDelegate(),
//                   );
//                 },
//                 icon: const Icon(Icons.search))
//           ]),
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: items.length,
//                 itemBuilder: (BuildContext ctx, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SingleItem(items: items[index]),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       margin: EdgeInsets.all(20),
//                       height: 300,
//                       child: Stack(
//                         children: [
//                           Positioned.fill(
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: Image.network(
//                                 items[index].item_image,
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
//                                   items[index].name,
//                                   style: TextStyle(
//                                     color: Colors.white.withOpacity(0.7),
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 '£' + items[index].price.toString(),
//                                 style: TextStyle(
//                                   color: Colors.white.withOpacity(0.7),
//                                   fontSize: 20,
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomSearchDelegate extends SearchDelegate {
//   List<String> searchTerms = [
//     'Drill',
//     'Lawn mower',
//     'Water gun',
//     'Violin',
//     'Cricket bat',
//     'Macbook',
//   ];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var tool in searchTerms) {
//       if (tool.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(tool);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: (context, index) {
//           var result = matchQuery[index];
//           return ListTile(
//             title: Text(result),
//           );
//         });
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var tool in searchTerms) {
//       if (tool.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(tool);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: (context, index) {
//           var result = matchQuery[index];
//           return ListTile(
//             title: Text(result),
//           );
//         });
//   }
// }
