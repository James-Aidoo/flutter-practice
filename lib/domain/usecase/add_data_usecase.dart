import 'package:flutter_cubit_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_cubit_app/core/usecase/usecase.dart';
import 'package:flutter_cubit_app/domain/repository/place_repository.dart';

class AddDataUseCase extends UseCase<void, List<String>> {
  final PlaceRepository _repository;

  AddDataUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(List<String> params) async {
    return await _repository.addData(params);
  }
}
