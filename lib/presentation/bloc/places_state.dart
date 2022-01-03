part of 'places_bloc.dart';

@freezed
class PlacesState with _$PlacesState {
  const factory PlacesState.initial() = _Initial;
  const factory PlacesState.loading() = Loading;
  const factory PlacesState.loaded(List<Place> places) = Loaded;
  const factory PlacesState.error(String message) = Error;
}
