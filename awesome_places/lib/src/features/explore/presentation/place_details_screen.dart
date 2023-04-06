import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/features/explore/presentation/widgets/place_divider.dart';
import 'package:awesome_places/src/features/explore/presentation/widgets/stars.dart';
import 'package:awesome_places/src/features/settings/data/themes/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'widgets/place_back_button.dart';

class PlaceDetailsScreen extends StatefulWidget {
  const PlaceDetailsScreen({Key? key, required this.place}) : super(key: key);
  final Place place;

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  bool heartClick = false;
  late GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: MemoryImage(widget.place.image),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.1),
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          // const PlaceBackButton(),
          placeDetails(),
        ],
      ),
    ));
  }

  Widget placeDetails() {
    return DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 1.0,
        minChildSize: 0.5,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            height: 500,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 30, 30, 30),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 35,
                            color: Colors.white54,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.place.name,
                      style: Theme.of(context).textTheme.headlineMedium!,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.place.address!.country,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: SecondaryText),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              heartClick = !heartClick;
                            });
                          },
                          icon: Icon(
                            heartClick ? Icons.favorite : Icons.favorite_border,
                            color: heartClick ? Colors.red : Colors.white,
                          ),
                        ),
                        const SizedBox(width: 7),
                        Stars(rating: widget.place.rating),
                      ],
                    ),
                    const PlaceDivider(),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.place.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: SecondaryText),
                    ),
                    const PlaceDivider(),
                    Text(
                      "Location",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(child: location(context)),
                    const PlaceDivider(),
                    Text(
                      "Route",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      constraints:
                          BoxConstraints(minHeight: 100, maxHeight: 600),
                      child: navigation(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget navigation() {
    return GoogleMap(
      onMapCreated: (controller) {
        mapController = controller;
      },
      initialCameraPosition: CameraPosition(
          target: LatLng(widget.place.coordinate!.latitude,
              widget.place.coordinate!.longitude),
          zoom: 12),
    );
  }

  Widget location(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Latitute: ${widget.place.coordinate!.latitude}\nLongitude: ${widget.place.coordinate!.longitude}",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: SecondaryText),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              const SizedBox(height: 10),
              iconWithText(
                icon: Icons.location_city,
                text: widget.place.address!.city,
              ),
              const SizedBox(height: 10),
              iconWithText(
                icon: Icons.place,
                text: widget.place.address!.state,
              ),
              const SizedBox(height: 10),
              iconWithText(
                icon: Icons.local_post_office,
                text: widget.place.address!.zipCode,
              ),
              const SizedBox(height: 10),
              iconWithText(
                icon: Icons.home,
                text: widget.place.address!.country,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget iconWithText({required IconData icon, required String text}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: const Color(0x302196f3),
          child: Icon(
            icon,
            size: 15,
            color: const Color(0xFF2196f3),
          ),
        ),
        const SizedBox(width: 7),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
