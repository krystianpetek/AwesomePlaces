import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/features/explore/presentation/place_list_view_item.dart';
import 'package:flutter/material.dart';

class PlaceListView extends StatelessWidget {
  const PlaceListView({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return PlaceListViewItem(place: places[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 30);
        },
        itemCount: places.length);
  }
}
