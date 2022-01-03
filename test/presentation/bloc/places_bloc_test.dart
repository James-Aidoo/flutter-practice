import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_cubit_app/core/error/failures.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:flutter_cubit_app/domain/repository/place_repository.dart';
import 'package:flutter_cubit_app/domain/usecase/get_places_usecase.dart';
import 'package:flutter_cubit_app/presentation/bloc/places_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../domain/usecase/get_places_usecase_test.mocks.dart';

void main() {
  group('PlacesBloc', () {
    late PlaceRepository repository;
    late GetPlacesUseCase useCase;
    late PlacesBloc placesBloc;

    setUp(() {
      repository = MockPlaceRepository();
      useCase = GetPlacesUseCase(repository);
      placesBloc = PlacesBloc(getPlacesUseCase: useCase);
    });

    test('Initial State is PlacesState.initial', () {
      expect(placesBloc.state, const PlacesState.initial());
    });

    group('getPlaces', () {
      blocTest<PlacesBloc, PlacesState>(
        'emits [Loading, Loaded] when PlacesEvent.getPlaces() is added.',
        build: () {
          when(repository.getPlaces())
              .thenAnswer((_) async => const Right(<Place>[]));
          return placesBloc;
        },
        act: (bloc) => bloc.add(const GetPlacesEvent()),
        expect: () => const <PlacesState>[Loading(), Loaded([])],
        verify: (_) => verify(repository.getPlaces()).called(1),
      );

      blocTest<PlacesBloc, PlacesState>(
        'emits [Loading, Error] when PlacesEvent.getPlaces() is added.',
        build: () {
          when(repository.getPlaces())
              .thenAnswer((_) async => Left(ServerFailure()));
          return placesBloc;
        },
        act: (bloc) => bloc.add(const GetPlacesEvent()),
        expect: () => const <PlacesState>[Loading(), Error('')],
        verify: (_) => verify(repository.getPlaces()).called(1),
      );
    });
  });
}
