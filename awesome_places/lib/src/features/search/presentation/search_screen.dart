import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/features/explore/data/services/places_service.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:awesome_places/src/widgets/circle_image.dart';
import 'package:awesome_places/src/widgets/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Place> places = [];
  List<Place> foundedPlaces = [];

  void onSearch(String value) {
    setState(() {
      foundedPlaces = places
          .where((place) => place.name.toLowerCase().contains(value))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("Search places")],
                )
              ],
            ),
            centerTitle: true,
          ),
          body: Container(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 16,
              right: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 50,
                  child: TextField(
                    autofocus: true,
                    onChanged: (value) => onSearch(value),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0x30505050),
                      contentPadding: const EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(color: Colors.white)),
                      hintText: "Search places",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Colors.grey.shade600),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                if (places.isEmpty)
                  Expanded(
                    child: FutureBuilder(
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
                            places = snapshot.data!;
                            foundedPlaces = places;
                            return ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return FadeAnimation(
                                    duration: 1000,
                                    delay: index * 50,
                                    child: showPlace(foundedPlaces[index]));
                              },
                              itemCount: places.length,
                              separatorBuilder: (context, index) {
                                return FadeAnimation(
                                    duration: 1000,
                                    delay: index * 50,
                                    child: const Divider(height: 5));
                              },
                            );
                          default:
                            return Container();
                        }
                      },
                    ),
                  )
                else
                  Expanded(
                    child: foundedPlaces.isNotEmpty
                        ? ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return showPlace(foundedPlaces[index]);
                            },
                            itemCount: foundedPlaces.length,
                            separatorBuilder: (context, index) =>
                                const Divider(height: 5),
                          )
                        : const Center(
                            child: Text("No places found",
                                style: TextStyle(color: Colors.white)),
                          ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget showPlace(Place places) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.place.name, extra: places);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: [
            Row(children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircleImage(
                  imageProvider: MemoryImage(places.image),
                  imageRadius: 35,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    places.name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    places.address!.country,
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
