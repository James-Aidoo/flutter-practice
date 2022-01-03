import 'package:flutter/foundation.dart';
import 'package:flutter_cubit_app/core/usecase/usecase.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:flutter_cubit_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_cubit_app/domain/repository/data_repository.dart';
import 'package:flutter_cubit_app/domain/storage/source/remote_data_source.dart';

class DataRepositoryImpl extends DataRepository {
  final RemoteDataSource _remoteDataSource;

  DataRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Place>>> getPlaces() async {
    return request(call: _remoteDataSource.getPlaces);
  }

  Future<Either<Failure, Type>> request<Param, Type>({
    required Future<Type> Function(Param) call,
    Param? param,
    dynamic Function(Type)? transform,
  }) async {
    param ??= NoParams() as Param;
    transform ??= (t) => t;
    try {
      return Right(transform(await call(param as Param)));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(ServerFailure());
    }
  }
}
