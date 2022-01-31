import 'package:flutter_cubit_app/data/repository/data_repository_impl.dart';
import 'package:flutter_cubit_app/data/repository/place_repository_impl.dart';
import 'package:flutter_cubit_app/data/storage/remote/remote_data_client.dart';
import 'package:flutter_cubit_app/data/storage/remote/remote_data_service.dart';
import 'package:flutter_cubit_app/data/storage/source/remote_data_source_impl.dart';
import 'package:flutter_cubit_app/domain/repository/data_repository.dart';
import 'package:flutter_cubit_app/domain/repository/place_repository.dart';
import 'package:flutter_cubit_app/domain/storage/source/remote_data_source.dart';
import 'package:flutter_cubit_app/domain/usecase/add_data_usecase.dart';
import 'package:flutter_cubit_app/domain/usecase/get_data_usecase.dart';
import 'package:flutter_cubit_app/domain/usecase/get_places_usecase.dart';
import 'package:flutter_cubit_app/presentation/bloc/places_bloc.dart';
import 'package:flutter_cubit_app/presentation/bloc/stream_test_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

final sl = GetIt.I;

Future<void> registerCompononents() async {
  //! State Management (Bloc)
  sl.registerFactory(() => PlacesBloc(sl()));
  sl.registerFactory(() => StreamTestBloc(sl(), sl()));

  //! Usecase
  sl.registerLazySingleton(() => GetPlacesUseCase(sl()));
  sl.registerLazySingleton(() => GetDataUseCase(sl()));
  sl.registerLazySingleton(() => AddDataUseCase(sl()));

  //! Repositories and Sources
  // Repository
  sl.registerLazySingleton<DataRepository>(() => DataRepositoryImpl(sl()));
  sl.registerLazySingleton<PlaceRepository>(() => PlaceRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(sl(), sl()));

  sl.registerLazySingleton<RemoteDataService>(() => RemoteDataService(sl()));

  //! External libraries
  sl.registerLazySingleton(() => RemoteDataClient.dio);

  final _pref = await StreamingSharedPreferences.instance;
  sl.registerLazySingleton(() => _pref);
}
