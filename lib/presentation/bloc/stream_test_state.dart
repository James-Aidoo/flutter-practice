part of 'stream_test_bloc.dart';

@freezed
class StreamTestState with _$StreamTestState {
  const factory StreamTestState.initial() = _Initial;
  const factory StreamTestState.loading() = Loading;
  const factory StreamTestState.loaded(List<String>? data) = Loaded;
  const factory StreamTestState.error(String message) = Error;
}
