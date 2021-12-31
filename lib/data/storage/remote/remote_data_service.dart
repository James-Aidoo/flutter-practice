import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'remote_data_service.g.dart';

@RestApi()
abstract class RemoteDataService {
  factory RemoteDataService(Dio dio, {String baseUrl}) = _RemoteDataService;

  // @GET("/tasks")
  // Future<List<Object>> getTasks();
}
