import 'dart:convert';

import 'package:ilmnur_mobile/core/error/exception_handler.dart';
import 'package:ilmnur_mobile/features/lessons/data/models/courseDto.dart';
import 'package:ilmnur_mobile/features/lessons/data/models/lessons.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';
import 'package:ilmnur_mobile/features/lessons/domain/repositories/lessons_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/lessons_service.dart';

class ImplLessonsRepo extends LessonsRepo {
  final LessonsService lessonsService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplLessonsRepo({required this.lessonsService});

  Future<void> _initializePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  // Retrieve lessons from SharedPreferences
  Future<List<Lessons>?> _getLessonssFromPreferences() async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String>? lessonsJsonStrings =
        preferences?.getStringList('Lessonss');

    if (lessonsJsonStrings == null) {
      return null;
    }

    return lessonsJsonStrings.map((lessonsJson) {
      return Lessons.fromJson(jsonDecode(lessonsJson) as Map<String, dynamic>);
    }).toList();
  }

  // Save lessons to SharedPreferences
  Future<void> _saveLessonssToPreferences(List<Lessons> lessons) async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String> lessonsJsonStrings = lessons.map((lessons) {
      return jsonEncode(lessons.toJson());
    }).toList();

    preferences?.setStringList('Lessonss', lessonsJsonStrings);
  }

  @override
  Future<DataState<CourseDto>> getLessonss(int id) async {
    try {
      // final List<Lessons>? lessons = await _getLessonssFromPreferences();
      // if (lessons != null && lessons.isNotEmpty) {
      //   // return DataSuccess<List<Lessons>>(data: lessons);
      // }
      final response = await lessonsService.getLessonss(id);
      await _saveLessonssToPreferences(response.data.lessons);
      return DataSuccess<CourseDto>(data: response.data);
    } catch (e) {
      print(e);
      return DataException.getError<CourseDto>(e);
    }
  }
}
