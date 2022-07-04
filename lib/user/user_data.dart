import 'dart:convert';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    username: 'oxlong123',
    name: 'Mike Oxlong',
    avatar:
        "https://media.istockphoto.com/photos/middle-aged-white-male-creative-in-casual-office-lounge-area-looks-to-picture-id1146478798?s=612x612",
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
