import 'package:awesome_places/src/providers/places/places_provider.dart';
import 'package:awesome_places/src/features/explore/presentation/place_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceGridView extends StatelessWidget {
  const PlaceGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final placeNotifier = ref.watch(placesProvider);
        return GridView.builder(
          itemCount: placeNotifier.places.length,
          itemBuilder: (BuildContext context, int index) {
            return PlaceGridViewItem(
              place: placeNotifier.places[index],
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        );
      },
    );
  }
}
