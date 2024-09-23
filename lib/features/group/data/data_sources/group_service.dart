import 'package:dio/dio.dart';
import 'package:ilmnur_mobile/features/group/data/models/group.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_mobile/core/network/urls.dart';

part 'group_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class GroupService {
  factory GroupService(Dio dio, {String baseUrl}) = _GroupService;

  factory GroupService.create() {
    final dio = Dio();
    return GroupService(dio);
  }

  @GET("lesson/getByCourse/{id}")
  Future<HttpResponse<List<Group>>> getGroups(@Path("id") int id); // Accept id as a parameter
}
