import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
class Place with _$Place {
  const factory Place({
    required String name,
    required String img,
    required int price,
    required int people,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'selected_people') required int selectedPeople,
    required int stars,
    required String description,
    required String location,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}
