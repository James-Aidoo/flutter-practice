import 'package:flutter_cubit_app/core/usecase/usecase.dart';
import 'package:flutter_cubit_app/data/storage/remote/remote_data_service.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:flutter_cubit_app/domain/storage/source/remote_data_source.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final RemoteDataService _remoteDataService;

  RemoteDataSourceImpl(this._remoteDataService);

  @override
  Future<List<Place>> getPlaces(NoParams params) async {
    return await _remoteDataService.getPlaces();
  }
}
