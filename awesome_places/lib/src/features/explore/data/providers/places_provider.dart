import 'package:awesome_places/src/features/explore/data/models/explore_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exploreProvider =
    StateNotifierProvider<ExploreNotifier, ExploreStateModel>((ref) {
  return ExploreNotifier();
});

class ExploreNotifier extends StateNotifier<ExploreStateModel> {
  ExploreNotifier([ExploreStateModel? state])
      : super(state ?? ExploreStateModel.initialize());
}
