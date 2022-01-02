import 'package:dartz/dartz.dart';
import 'package:flutter_cubit_app/core/usecase/usecase.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:flutter_cubit_app/domain/repository/place_repository.dart';
import 'package:flutter_cubit_app/domain/usecase/get_places_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_places_usecase_test.mocks.dart';

@GenerateMocks([PlaceRepository])
void main() {
  late PlaceRepository repository;
  late GetPlacesUseCase useCase;

  final expected = <Place>[];

  setUp(() {
    repository = MockPlaceRepository();
    useCase = GetPlacesUseCase(repository);
  });

  test('should get the list of places from the server', () async {
    // arrange
    when(repository.getPlaces()).thenAnswer((_) async => Right(expected));
    // act
    final result = await useCase(NoParams());
    // assert
    expect(result, Right(expected));
    verify(repository.getPlaces()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
