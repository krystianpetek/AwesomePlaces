import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/providers/places/enums/place_view_enum.dart';

class PlaceStateModel {
  List<Place> places;
  PlaceViewEnum placeViewEnum;

  PlaceStateModel(
      {this.places = const <Place>[],
      this.placeViewEnum = PlaceViewEnum.ListView});

  PlaceStateModel copyWith({
    List<Place>? places,
    PlaceViewEnum? placeViewEnum,
  }) {
    return PlaceStateModel(
      placeViewEnum: placeViewEnum ?? this.placeViewEnum,
      places: places ?? this.places,
    );
  }

  factory PlaceStateModel.initialize() {
    return PlaceStateModel(
      places: <Place>[],
      placeViewEnum: PlaceViewEnum.ListView,
    );
  }
}
