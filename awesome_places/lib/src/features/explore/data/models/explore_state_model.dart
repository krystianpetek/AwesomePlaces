import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/features/explore/enums/place_view_enum.dart';

class ExploreStateModel {
  List<Place> places;
  PlaceViewEnum placeViewEnum;

  ExploreStateModel(
      {this.places = const <Place>[],
      this.placeViewEnum = PlaceViewEnum.ListView});

  ExploreStateModel copyWith({
    List<Place>? places,
    PlaceViewEnum? placeViewEnum,
  }) {
    return ExploreStateModel(
      placeViewEnum: placeViewEnum ?? this.placeViewEnum,
      places: places ?? this.places,
    );
  }

  factory ExploreStateModel.initialize() {
    return ExploreStateModel(
      places: <Place>[],
      placeViewEnum: PlaceViewEnum.ListView,
    );
  }
}
