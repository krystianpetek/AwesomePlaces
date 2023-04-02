import 'package:awesome_places/src/features/explore/presentation/place_grid_view_item.dart';
import 'package:flutter/material.dart';

import '../data/models/place.dart';

class PlaceGridView extends StatelessWidget {
  const PlaceGridView({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          return PlaceGridViewItem(
            place: places[index],
          );
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}
