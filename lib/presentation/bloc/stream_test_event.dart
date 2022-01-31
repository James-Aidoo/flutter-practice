part of 'stream_test_bloc.dart';

@freezed
class StreamTestEvent with _$StreamTestEvent {
  const factory StreamTestEvent.started() = _Started;
  const factory StreamTestEvent.getData() = GetDataEvent;
  const factory StreamTestEvent.addData(List<String> data) = AddDataEvent;
}
