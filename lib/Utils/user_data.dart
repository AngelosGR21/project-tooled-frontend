import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    username: 'oxlong123',
    name: 'Bob Dudley',
    avatar:
        "https://i.ibb.co/YfHTxYx/joseph-gonzalez-i-Fg-Rcq-Hznqg-unsplash.jpg",
    lat: '51.51561',
    long: '-0.0769',
    password: '***********',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
