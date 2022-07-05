import "../globals.dart" as globals;

import "package:http/http.dart" as http;
import 'dart:convert';

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
