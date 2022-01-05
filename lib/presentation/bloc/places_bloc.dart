import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_app/core/usecase/usecase.dart';
import 'package:flutter_cubit_app/domain/model/place.dart';
import 'package:flutter_cubit_app/domain/usecase/get_places_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'places_event.dart';
part 'places_state.dart';
part 'places_bloc.freezed.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final GetPlacesUseCase _getPlacesUseCase;

  PlacesBloc(this._getPlacesUseCase) : super(const _Initial()) {
    on<GetPlacesEvent>((event, emit) async {
      emit(const PlacesState.loading());
      final result = await _getPlacesUseCase(NoParams());
      result.fold((l) => emit(PlacesState.error(l.message)),
          (r) => emit(PlacesState.loaded(r)));
    });
  }
}
