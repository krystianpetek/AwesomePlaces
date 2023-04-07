import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/features/explore/data/services/places_service.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:awesome_places/src/widgets/circle_image.dart';
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
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 40,
                  child: TextField(
                    onChanged: (value) => onSearch(value),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[850],
                      contentPadding: const EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintText: "Search places",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Colors.grey.shade500),
                    ),
                  ),
                ),
                if (places.isEmpty)
                  Expanded(
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
                            places = snapshot.data!;
                            foundedPlaces = places;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return showPlace(foundedPlaces[index]);
                              },
                              itemCount: places.length,
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
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return showPlace(foundedPlaces[index]);
                            },
                            itemCount: foundedPlaces.length,
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
                width: 60,
                height: 60,
                child: CircleImage(
                  imageProvider: MemoryImage(places.image),
                  imageRadius: 35,
                )),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(places.name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              // Text(places.description,
              //     style: TextStyle(color: Colors.grey[500])),
            ])
          ]),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.place.name, extra: places);
            },
            child: AnimatedContainer(
              height: 35,
              width: 110,
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.transparent,
                  )),
              child: Center(
                child: Text('Go'),
              ),
            ),
            // child: AnimatedContainer(
            //     height: 35,
            //     width: 110,
            //     duration: Duration(milliseconds: 300),
            //     decoration: BoxDecoration(
            //         color: user.isFollowedByMe
            //             ? Colors.blue[700]
            //             : Color(0xffffff),
            //         borderRadius: BorderRadius.circular(5),
            //         border: Border.all(
            //           color: user.isFollowedByMe
            //               ? Colors.transparent
            //               : Colors.grey.shade700,
            //         )),
            //     child: Center(
            //         child: Text(user.isFollowedByMe ? 'Unfollow' : 'Follow',
            //             style: TextStyle(
            //                 color: user.isFollowedByMe
            //                     ? Colors.white
            //                     : Colors.white)))),
          )
        ],
      ),
    );
  }
}
