class User {
  String avatar;
  String name;
  String lat;
  String long;
  String username;
  String password;

  // Constructor
  User({
    required this.avatar,
    required this.name,
    required this.lat,
    required this.long,
    required this.username,
    required this.password,
  });

  User copy({
    String? avatar,
    String? name,
    String? lat,
    String? long,
    String? username,
    String? password,
  }) =>
      User(
        avatar: avatar ?? this.avatar,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        username: username ?? this.username,
        password: password ?? this.password,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        avatar: json['avatar'],
        name: json['name'],
        lat: json['lat'],
        long: json['long'],
        username: json['username'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'avatar': avatar,
        'name': name,
        'lat': lat,
        'long': long,
        'username': username,
        'password': password,
      };
}
