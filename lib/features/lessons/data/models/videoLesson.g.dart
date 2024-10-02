// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoLesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoLesson _$VideoLessonFromJson(Map<String, dynamic> json) => VideoLesson(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$VideoLessonToJson(VideoLesson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
    };
