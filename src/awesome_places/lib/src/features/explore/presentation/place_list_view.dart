import 'package:awesome_places/src/features/explore/data/providers/places_provider.dart';
import 'package:awesome_places/src/features/explore/presentation/place_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceListView extends StatelessWidget {
  const PlaceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final placeNotifier = ref.watch(placesProvider);
        return ListView.separated(
            itemBuilder: (context, index) {
              return PlaceListViewItem(place: placeNotifier.places[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                indent: 25,
                endIndent: 25,
                height: 50,
                thickness: 1,
              );
            },
            itemCount: placeNotifier.places.length);
      },
    );
  }
}
