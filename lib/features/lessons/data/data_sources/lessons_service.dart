import 'package:dio/dio.dart';
import 'package:ilmnur_mobile/features/lessons/data/models/courseDto.dart';
import 'package:ilmnur_mobile/features/lessons/data/models/lessons.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_mobile/core/network/urls.dart';

part 'lessons_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class LessonsService {
  factory LessonsService(Dio dio, {String baseUrl}) = _LessonsService;

  factory LessonsService.create() {
    final dio = Dio();
    return LessonsService(dio);
  }

  @GET("lesson/getByCourse/{id}")
  Future<HttpResponse<CourseDto>> getLessonss(@Path("id") int id);
}
