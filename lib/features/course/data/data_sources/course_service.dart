import 'package:dio/dio.dart';
import 'package:ilmnur_mobile/core/network/dio_manager.dart';
import 'package:ilmnur_mobile/features/course/data/models/course.dart';
import 'package:ilmnur_mobile/features/course/data/models/createcourse.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_mobile/core/network/urls.dart';

part 'course_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class CourseService {
  factory CourseService(Dio dio, {String baseUrl}) = _CourseService;

  factory CourseService.create() {
    // final dio = Dio();
    final dio = DioManager.getDio;
    return CourseService(dio);
  }

  @GET("course/getByCourse/{id}")
  Future<HttpResponse<List<Course>>> getCourses(@Path("id") int id);

  @POST("course/create")
  Future<HttpResponse<CreateCourseModel>> createCourse(@Body() FormData course);
}
