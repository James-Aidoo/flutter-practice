part of 'places_bloc.dart';

@freezed
class PlacesEvent with _$PlacesEvent {
  const factory PlacesEvent.started() = _Started;
  const factory PlacesEvent.getPlaces() = GetPlacesEvent;
}
