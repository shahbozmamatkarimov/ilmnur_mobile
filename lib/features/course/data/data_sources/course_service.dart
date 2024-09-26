import 'package:dio/dio.dart';
import 'package:ilmnur_mobile/features/course/data/models/course.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_mobile/core/network/urls.dart';

part 'course_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class CourseService {
  factory CourseService(Dio dio, {String baseUrl}) = _CourseService;

  factory CourseService.create() {
    final dio = Dio();
    return CourseService(dio);
  }

  @GET("course/getByCourse/{id}")
  Future<HttpResponse<List<Course>>> getCourses(@Path("id") int id); // Accept id as a parameter
}
