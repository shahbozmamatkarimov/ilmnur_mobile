import 'package:dio/dio.dart';
import 'package:ilmnur_mobile/features/home/data/models/group/group.dart';
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

  @GET("group")
  Future<HttpResponse<List<Group>>> getGroups();
}
