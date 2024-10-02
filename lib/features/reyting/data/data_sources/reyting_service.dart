import 'package:dio/dio.dart';
import 'package:ilmnur_mobile/features/reyting/data/models/reyting.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_mobile/core/network/urls.dart';

part 'reyting_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class ReytingService {
  factory ReytingService(Dio dio, {String baseUrl}) = _ReytingService;

  factory ReytingService.create() {
    final dio = Dio();
    return ReytingService(dio);
  }

  // @GET("subject")
  // Future<HttpResponse<List<Reyting>>> getReytings();

  @GET("video_reyting/{id}")
  Future<HttpResponse<Reyting>> getReyting(@Path("id") int id);
}
