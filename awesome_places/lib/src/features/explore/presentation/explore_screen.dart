import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/features/explore/data/services/places_service.dart';
import 'package:awesome_places/src/features/explore/enums/place_view_enum.dart';
import 'package:awesome_places/src/features/explore/presentation/place_grid_view.dart';
import 'package:awesome_places/src/features/explore/presentation/place_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  ExploreScreen({super.key});
  late List<Place> places = <Place>[];
  PlaceViewEnum placeViewEnum = PlaceViewEnum.ListView;

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text("List view"),
                      onTap: () {
                        setState(() {
                          widget.placeViewEnum = PlaceViewEnum.ListView;
                        });
                      },
                    ),
                    PopupMenuItem(
                      child: Text("Grid view"),
                      onTap: () {
                        setState(() {
                          widget.placeViewEnum = PlaceViewEnum.GridView;
                        });
                      },
                    )
                  ];
                },
              ),
            ],
          ),
          Expanded(
              child: (widget.places.isEmpty)
                  ? SizedBox(
                      child: FutureBuilder(
                        future: PlacesService(ref: ref).getPlaces(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case ConnectionState.done:
                              widget.places = snapshot.data!;
                              return Expanded(
                                  child: widget.placeViewEnum ==
                                          PlaceViewEnum.ListView
                                      ? PlaceListView(places: snapshot.data!)
                                      : PlaceGridView(places: snapshot.data!));
                            default:
                              return Container();
                          }
                        },
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height - 150,
                      child: widget.placeViewEnum == PlaceViewEnum.ListView
                          ? PlaceListView(places: widget.places)
                          : PlaceGridView(places: widget.places))),
        ],
      ),
    );
  }
}
