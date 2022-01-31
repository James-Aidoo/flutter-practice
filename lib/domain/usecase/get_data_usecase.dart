import 'package:flutter_cubit_app/core/usecase/stream_usecase.dart';
import 'package:flutter_cubit_app/core/usecase/usecase.dart';
import 'package:flutter_cubit_app/domain/repository/place_repository.dart';

class GetDataUseCase extends StreamUseCase<List<String>?, NoParams> {
  final PlaceRepository _repository;

  GetDataUseCase(this._repository);

  @override
  Stream<List<String>?> call(NoParams params) {
    return _repository.getData();
  }
}
