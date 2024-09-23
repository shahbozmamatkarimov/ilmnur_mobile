import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class Group {
  final int id;
  final String title;
  final String description;
  final String cover;
  final int price;
  final int discount;
  final DateTime createdAt;
  final DateTime updatedAt;

  Group({
    required this.id,
    required this.title,
    required this.description,
    required this.cover,
    required this.price,
    required this.discount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
