// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:ui';

class Items {
  String name;
  int price;
  String body;
  int user_id;
  int category_id;
  String item_image;
  List<Items> subItems;

  Items(
      {required this.name,
      required this.price,
      required this.body,
      required this.user_id,
      required this.category_id,
      required this.item_image,
      required this.subItems});
}
