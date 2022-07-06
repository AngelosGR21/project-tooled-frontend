// // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';

// class Search extends StatefulWidget {
//   const Search({Key? key}) : super(key: key);

//   @override
//   State<Search> createState() => _SearchState();
// }

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
