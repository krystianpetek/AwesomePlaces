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
                          ],
                        ),
                        const SizedBox(height: 8),
                        topPlaces(
                          context,
                          placeNotifier.places.reduce(
                            (value, element) =>
                                value.rating > element.rating ? value : element,
                          ),
                        ),
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

  Widget topPlaces(BuildContext context, Place place) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Top places",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                context.goNamed(Routes.explore.name);
              },
              child: const Text(
                "see all",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(maxHeight: 130),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            onTap: () {
              context.pushNamed(Routes.place.name, extra: place);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[900],
                border: Border.all(width: 1, color: Colors.grey.shade800),
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        opacity: 0.9,
                        image: MemoryImage(place.image),
                      ),
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(),
                      Positioned(
                        top: 5,
                        left: 10,
                        child: Text(
                          place.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 10,
                        width: MediaQuery.of(context).size.width - 150,
                        child: Text(
                          place.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          softWrap: true,
                          style: Theme.of(context).textTheme.bodySmall!,
                        ),
                      ),
                      Positioned(
                          bottom: 8,
                          left: 10,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 16,
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${place.address!.country}, ${place.address!.city}',
                                style: TextStyle(
                                    color: Colors.grey.shade400, fontSize: 12),
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
