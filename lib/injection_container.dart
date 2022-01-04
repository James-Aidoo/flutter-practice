import 'package:flutter_cubit_app/data/repository/data_repository_impl.dart';
import 'package:flutter_cubit_app/data/repository/place_repository_impl.dart';
import 'package:flutter_cubit_app/data/storage/remote/remote_data_client.dart';
import 'package:flutter_cubit_app/data/storage/remote/remote_data_service.dart';
import 'package:flutter_cubit_app/data/storage/source/remote_data_source_impl.dart';
import 'package:flutter_cubit_app/domain/repository/data_repository.dart';
import 'package:flutter_cubit_app/domain/repository/place_repository.dart';
import 'package:flutter_cubit_app/domain/storage/source/remote_data_source.dart';
import 'package:flutter_cubit_app/domain/usecase/get_places_usecase.dart';
import 'package:flutter_cubit_app/presentation/bloc/places_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void registerCompononents() {
  //! State Management (Bloc)
  // Note: ```getIt()``` is short for ```getIt.call()```
  getIt.registerFactory(() => PlacesBloc(getPlacesUseCase: getIt()));

  //! Usecase
  getIt.registerLazySingleton(() => GetPlacesUseCase(getIt()));

  //! Repositories and Sources
  // Repository
  getIt.registerLazySingleton<DataRepository>(
    () => DataRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<PlaceRepository>(
    () => PlaceRepositoryImpl(getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<RemoteDataService>(
    () => RemoteDataService(getIt()),
  );

  //! External libraries
  getIt.registerLazySingleton(() => RemoteDataClient.dio);
}
