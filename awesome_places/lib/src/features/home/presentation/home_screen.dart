import 'dart:math';

import 'package:awesome_places/src/features/authentication/data/providers/authentication_provider.dart';
import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/features/explore/data/providers/places_provider.dart';
import 'package:awesome_places/src/features/explore/data/services/places_service.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Awesome Places"),
        ),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final user = ref.watch(authenticationProvider);
          final placeNotifier = ref.watch(placesProvider);
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
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    const Text("Hi, ",
                                        style: TextStyle(fontSize: 20)),
                                    Text(
                                      user.user,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue.shade400,
                                      ),
                                    ),
                                  ]),
                                  Text('Where would you like to go?',
                                      style:
                                          TextStyle(color: Colors.grey[500])),
                                ]),
                            const Spacer(),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 3,
                                    blurStyle: BlurStyle.outer,
                                  )
                                ],
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/author.png'),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(3),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  context.goNamed(Routes.profile.name);
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            topPlaces(
                              placeNotifier.places.reduce((value, element) =>
                                  value.rating > element.rating
                                      ? value
                                      : element),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                default:
                  return Container();
              }
            },
          );
        },
      ),
    );
  }

  Widget topPlaces(Place place) {
    return Container(
      child: InkWell(
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
