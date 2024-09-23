import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class Lesson {
  final int id;
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;

  Lesson({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
  Map<String, dynamic> toJson() => _$LessonToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
