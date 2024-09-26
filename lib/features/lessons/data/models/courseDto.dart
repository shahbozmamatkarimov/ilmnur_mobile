import 'package:ilmnur_mobile/features/course/data/models/course.dart';
import 'package:ilmnur_mobile/features/lessons/data/models/lessons.dart'; // Import Lessons

class CourseDto {
  final List<Lessons> lessons;
  final Course course;

  CourseDto({required this.lessons, required this.course});

  factory CourseDto.fromJson(Map<String, dynamic> json) => CourseDto(
        lessons: (json['lessons'] as List)
            .map((lesson) => Lessons.fromJson(lesson))
            .toList(),
        course: Course.fromJson(json[
            'course']), // Assuming you have a fromJson constructor for Course
      );
}
