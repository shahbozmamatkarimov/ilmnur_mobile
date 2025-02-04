import 'dart:convert';

import 'package:ilmnur_mobile/features/lessons/data/models/videoLesson.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lessons.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class Lessons {
  final int id;
  final String title;
  // final bool published;
  final String type;
  final List<VideoLesson> lessons;
  final DateTime createdAt;
  final DateTime updatedAt;

  Lessons({
    required this.id,
    required this.title,
    required this.type,
    // required this.published,
    List<VideoLesson>? lessons,
    required this.createdAt,
    required this.updatedAt,
  }) : lessons = lessons ?? [];

  factory Lessons.fromJson(Map<String, dynamic> json) =>
      _$LessonsFromJson(json);
  Map<String, dynamic> toJson() => _$LessonsToJson(this);

  // Add this method
  String toJsonString() => jsonEncode(toJson());
}
