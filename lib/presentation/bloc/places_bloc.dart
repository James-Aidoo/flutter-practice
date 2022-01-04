import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_app/core/usecase/usecase.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:flutter_cubit_app/domain/usecase/get_places_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'places_event.dart';
part 'places_state.dart';
part 'places_bloc.freezed.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final GetPlacesUseCase getPlacesUseCase;

  PlacesBloc({required this.getPlacesUseCase}) : super(const _Initial()) {
    on<GetPlacesEvent>((event, emit) async {
      emit(const Loading());
      final result = await getPlacesUseCase(NoParams());
      result.fold((l) => emit(const Error('')), (r) => emit(Loaded(r)));
    });
  }
}
