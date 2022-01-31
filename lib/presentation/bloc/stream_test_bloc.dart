import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_app/core/usecase/usecase.dart';
import 'package:flutter_cubit_app/domain/usecase/add_data_usecase.dart';
import 'package:flutter_cubit_app/domain/usecase/get_data_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream_test_event.dart';
part 'stream_test_state.dart';
part 'stream_test_bloc.freezed.dart';

class StreamTestBloc extends Bloc<StreamTestEvent, StreamTestState> {
  final GetDataUseCase _getData;
  final AddDataUseCase _addData;

  // int timesCalled = 0;

  StreamTestBloc(this._getData, this._addData) : super(const _Initial()) {
    on<GetDataEvent>((event, emit) async {
      emit(const StreamTestState.loading());
      await for (final value in _getData(NoParams())) {
        emit(StreamTestState.loaded(value));
      }
    });

    on<AddDataEvent>((event, emit) async {
      emit(const StreamTestState.loading());
      final result = await _addData(event.data);
      result.fold(
          (l) => print('ERROR: $l'), (r) => print('saved successfully'));
    });
  }
}
