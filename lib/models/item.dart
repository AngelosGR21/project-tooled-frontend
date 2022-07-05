// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:ui';

class Item {
  final int itemId;
  final String name;
  final int price;
  final String body;
  final String itemImage;
  final DateTime createdAt;
  final int rating;
  final bool isAvailable;
  final String lat;
  final String long;
  final int userId;
  final int categoryId;
  final String category;

  const Item({
    required this.itemId,
    required this.name,
    required this.price,
    required this.body,
    required this.itemImage,
    required this.createdAt,
    required this.rating,
    required this.isAvailable,
    required this.lat,
    required this.long,
    required this.userId,
    required this.categoryId,
    required this.category,
  });
}
