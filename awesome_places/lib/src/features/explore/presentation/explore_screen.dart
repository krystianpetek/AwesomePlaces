import 'package:awesome_places/src/features/explore/data/providers/places_provider.dart';
import 'package:awesome_places/src/features/explore/data/services/places_service.dart';
import 'package:awesome_places/src/features/explore/enums/place_view_enum.dart';
import 'package:awesome_places/src/features/explore/presentation/place_grid_view.dart';
import 'package:awesome_places/src/features/explore/presentation/place_list_view.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    final exploreNotifier = ref.watch(exploreProvider);
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: (exploreNotifier.places.isEmpty)
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
                            exploreNotifier.places = snapshot.data!;
                            return Expanded(
                              child: exploreNotifier.placeViewEnum ==
                                      PlaceViewEnum.ListView
                                  ? const PlaceListView()
                                  : const PlaceGridView(),
                            );
                          default:
                            return Container();
                        }
                      },
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height - 1040,
                    child:
                        exploreNotifier.placeViewEnum == PlaceViewEnum.ListView
                            ? const PlaceListView()
                            : const PlaceGridView(),
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PopupMenuButton(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: const Text("List view"),
                      onTap: () {
                        setState(() {
                          exploreNotifier.placeViewEnum =
                              PlaceViewEnum.ListView;
                        });
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("Grid view"),
                      onTap: () {
                        setState(() {
                          exploreNotifier.placeViewEnum =
                              PlaceViewEnum.GridView;
                        });
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("List fullscreen view"),
                      onTap: () {
                        context.goNamed(
                          Routes.placeFullScreen.name,
                        );
                      },
                    )
                  ];
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
