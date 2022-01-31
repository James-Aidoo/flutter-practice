import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:flutter_cubit_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_cubit_app/domain/repository/data_repository.dart';
import 'package:flutter_cubit_app/domain/repository/place_repository.dart';

class PlaceRepositoryImpl extends PlaceRepository {
  final DataRepository _repository;

  PlaceRepositoryImpl(this._repository);

  @override
  Future<Either<Failure, List<Place>>> getPlaces() async {
    return _repository.getPlaces();
  }

  @override
  Stream<List<String>?> getData() {
    return _repository.getData();
  }

  @override
  Future<Either<Failure, void>> addData(List<String> params) async {
    return _repository.addData(params);
  }
}
