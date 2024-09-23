import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  final int id;
  final String title;
  final String description;
  final String cover;
  final DateTime createdAt;
  final DateTime updatedAt;

  Group({
    required this.id,
    required this.title,
    required this.description,
    required this.cover,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
