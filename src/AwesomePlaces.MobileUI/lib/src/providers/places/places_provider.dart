import 'package:awesome_places/src/providers/places/models/place_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final placesProvider =
    StateNotifierProvider<PlaceNotifier, PlaceStateModel>((ref) {
  return PlaceNotifier();
});

class PlaceNotifier extends StateNotifier<PlaceStateModel> {
  PlaceNotifier([PlaceStateModel? state])
      : super(state ?? PlaceStateModel.initialize());
}
