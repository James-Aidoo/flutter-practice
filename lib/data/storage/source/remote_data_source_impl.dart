import 'package:flutter_cubit_app/core/usecase/usecase.dart';
import 'package:flutter_cubit_app/data/storage/remote/remote_data_service.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:flutter_cubit_app/domain/storage/source/remote_data_source.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final RemoteDataService _remoteDataService;
  final StreamingSharedPreferences _sPrefs;

  RemoteDataSourceImpl(this._remoteDataService, this._sPrefs);

  @override
  Future<List<Place>> getPlaces(NoParams params) async {
    return await _remoteDataService.getPlaces();
  }

  @override
  Stream<List<String>> getData() async* {
    yield* _sPrefs.getStringList(testKey, defaultValue: []);
  }

  @override
  Future<bool> addData(List<String> params) async {
    return await _sPrefs.setStringList(testKey, params);
  }
}

const String testKey = "data";
