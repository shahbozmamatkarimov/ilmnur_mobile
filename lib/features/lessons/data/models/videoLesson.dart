import 'package:json_annotation/json_annotation.dart';

part 'videoLesson.g.dart'; // Ensure this matches your filename

@JsonSerializable()
class VideoLesson {
  final int id;
  final String title;
  final String type;

  VideoLesson({
    required this.id,
    required this.title,
    required this.type,
  });

  factory VideoLesson.fromJson(Map<String, dynamic> json) =>
      _$VideoLessonFromJson(json);

  Map<String, dynamic> toJson() => _$VideoLessonToJson(this);
}
