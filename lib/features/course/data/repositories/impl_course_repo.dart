import 'dart:convert';

import 'package:ilmnur_mobile/core/error/exception_handler.dart';
import 'package:ilmnur_mobile/features/course/data/models/course.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';
import 'package:ilmnur_mobile/features/course/domain/repositories/course_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/course_service.dart';

class ImplCourseRepo extends CourseRepo {
  final CourseService courseService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplCourseRepo({required this.courseService});

  Future<void> _initializePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  // Retrieve courses from SharedPreferences
  Future<List<Course>?> _getCoursesFromPreferences() async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String>? courseJsonStrings = preferences?.getStringList('Courses');

    if (courseJsonStrings == null) {
      return null;
    }

    return courseJsonStrings.map((courseJson) {
      return Course.fromJson(jsonDecode(courseJson) as Map<String, dynamic>);
    }).toList();
  }

  // Save courses to SharedPreferences
  Future<void> _saveCoursesToPreferences(List<Course> courses) async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String> courseJsonStrings = courses.map((course) {
      return jsonEncode(course.toJson());
    }).toList();

    preferences?.setStringList('Courses', courseJsonStrings);
  }

  @override
  Future<DataState<List<Course>>> getCourses(int id) async {
    try {
      // final List<Course>? courses = await _getCoursesFromPreferences();
      // print(courses);
      // if (courses != null && courses.isNotEmpty) {
      // return DataSuccess<List<Course>>(data: courses);
      // }
      final response = await courseService.getCourses(id);
      print(response);
      // await _saveCoursesToPreferences(response.data);
      return DataSuccess<List<Course>>(data: response.data);
    } catch (e) {
      print(e);
      return DataException.getError<List<Course>>(e);
    }
  }
}
