import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../models/response_data.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://randomuser.me/api/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('?page={pageId}&results=20&exc=login,id&seed=abc')
  Future<ResponseData> getUsers(@Path('pageId') int pageId);
}
