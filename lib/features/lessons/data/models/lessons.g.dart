// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lessons _$LessonsFromJson(Map<String, dynamic> json) => Lessons(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      type: json['type'] as String,
      lessons: (json['lessons'] as List<dynamic>?)
          ?.map((e) => VideoLesson.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$LessonsToJson(Lessons instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'lessons': instance.lessons,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
