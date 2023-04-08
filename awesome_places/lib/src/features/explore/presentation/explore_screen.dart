import 'package:awesome_places/src/features/explore/data/models/place_state_model.dart';
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
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  Widget fetchData() {
    return Consumer(builder: (context, ref, child) {
      PlaceStateModel placeNotifier = ref.watch(placesProvider);
      return FutureBuilder(
        future: PlacesService(ref: ref).getPlaces(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            case ConnectionState.done:
              placeNotifier.places = snapshot.data!;
              return Expanded(
                child: placeNotifier.placeViewEnum == PlaceViewEnum.ListView
                    ? const PlaceListView()
                    : const PlaceGridView(),
              );
            default:
              return Container();
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final placeNotifier = ref.watch(placesProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text("List view"),
                  onTap: () {
                    setState(() {
                      placeNotifier.placeViewEnum = PlaceViewEnum.ListView;
                    });
                  },
                ),
                PopupMenuItem(
                  child: const Text("Grid view"),
                  onTap: () {
                    setState(() {
                      placeNotifier.placeViewEnum = PlaceViewEnum.GridView;
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
        title: const Text("Explore"),
        centerTitle: true,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: (placeNotifier.places.isEmpty)
                  ? SizedBox(child: fetchData())
                  : SizedBox(
                      child:
                          placeNotifier.placeViewEnum == PlaceViewEnum.ListView
                              ? const PlaceListView()
                              : const PlaceGridView(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
