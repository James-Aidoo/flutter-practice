import 'dart:io';

import 'package:dio/dio.dart';
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
    return _request(call: _remoteDataSource.getPlaces);
  }

  Future<Either<Failure, Type>> _request<Param, Type>({
    required Future<Type> Function(Param) call,
    Param? param,
    dynamic Function(Type)? transform,
  }) async {
    param ??= NoParams() as Param;
    transform ??= (type) => type;
    try {
      return Right(transform(await call(param as Param)));
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(ServerFailure(mapDioErrorToMessage(e)));
    } on SocketException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(ServerFailure('No Internet connection 😑'));
    } on FormatException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(ServerFailure('Unable to process the data'));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(GenericFailure());
    }
  }

  String mapDioErrorToMessage(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        {
          return 'The connection to the server timed out';
        }
      case DioErrorType.response:
        {
          if (dioError.response != null) {
            if (dioError.response!.statusCode! >= 500) {
              return 'Our servers are having issues with your request 😞';
            } else if (dioError.response!.statusCode == 404) {
              return 'The requested resource was not found 🤷🏾';
            } else if (dioError.response!.statusCode! >= 400) {
              return 'The server could not process the request. Make sure the data is accurate 🤦🏾';
            }
          }
          break;
        }
      case DioErrorType.cancel:
        return 'Your request was cancelled';
      case DioErrorType.other:
      default:
        return dioError.error?.toString() ?? 'An error occured';
    }
    return 'An error occured';
  }
}
