import 'package:dio/dio.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:retrofit/http.dart';

part 'remote_data_service.g.dart';

@RestApi()
abstract class RemoteDataService {
  factory RemoteDataService(Dio dio, {String baseUrl}) = _RemoteDataService;

  @GET("getplaces")
  Future<List<Place>> getPlaces();
}
