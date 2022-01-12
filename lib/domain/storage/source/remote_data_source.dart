import 'package:flutter_cubit_app/core/usecase/usecase.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';

abstract class RemoteDataSource {
  Future<List<Place>> getPlaces(NoParams params);
}
