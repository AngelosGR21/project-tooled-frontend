import "../globals.dart" as globals;

import "package:http/http.dart" as http;
import 'dart:convert';
import 'dart:async';

Future verifyCredentials(String username, String password) async {
  var url = Uri.parse("https://be-tooled.herokuapp.com/api/users/login");
  var requestBody = jsonEncode({
    'username': username.toString(),
    'password': password.toString(),
  });
  var response = await http.post(url,
      body: requestBody, headers: {"Content-type": "application/json"});
  if (response.statusCode == 200) {
    globals.token = response.headers["x-application-token"]!;
    globals.isLoggedIn = true;
    var decoded = await jsonDecode(response.body) as Map;
    return decoded["message"];
  } else if (response.statusCode == 400) {
    return 400;
  } else {
    return 500;
  }
}

Future<Map> createItem(
    String name,
    num price,
    String body,
    String itemImage,
    bool isAvailable,
    String lat,
    String long,
    int userId,
    int categoryId) async {
  final response = await http.post(
    Uri.parse('https://be-tooled.herokuapp.com/api/items'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "name": name,
      "price": price,
      "body": body,
      "item_image": itemImage,
      "is_available": true,
      "lat": lat,
      "long": long,
      "user_id": userId,
      "category_id": categoryId
    }),
  );

  if (response.statusCode == 201) {
    var item = jsonDecode(response.body) as Map;
    return item["item"];
  } else {
    throw Exception('Failed to create item.');
  }
}
