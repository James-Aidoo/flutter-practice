import 'package:dartz/dartz.dart';
import 'package:flutter_cubit_app/core/error/failures.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';

abstract class PlaceRepository {
  Future<Either<Failure, List<Place>>> getPlaces();

  Stream<List<String>?> getData();

  Future<Either<Failure, void>> addData(List<String> params);
}
