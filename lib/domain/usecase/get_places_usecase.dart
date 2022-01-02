import 'package:flutter_cubit_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_cubit_app/core/usecase/usecase.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:flutter_cubit_app/domain/repository/place_repository.dart';

class GetPlacesUseCase extends UseCase<List<Place>, NoParams> {
  final PlaceRepository _repository;

  GetPlacesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Place>>> call(NoParams params) async {
    return await _repository.getPlaces();
  }
}
