import 'package:dartz/dartz.dart';
import 'package:flutter_cubit_app/core/error/failures.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';

abstract class DataRepository {
  Future<Either<Failure, List<Place>>> getPlaces();
}
