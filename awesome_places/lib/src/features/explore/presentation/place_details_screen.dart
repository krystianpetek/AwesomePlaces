import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/features/explore/presentation/widgets/place_divider.dart';
import 'package:awesome_places/src/features/explore/presentation/widgets/stars.dart';
import 'package:awesome_places/src/features/settings/data/themes/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'widgets/place_back_button.dart';

class PlaceDetailsScreen extends StatefulWidget {
  PlaceDetailsScreen({Key? key, required this.place}) : super(key: key);
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
          const PlaceBackButton(),
          scroll(),
        ],
      ),
    ));
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 1.0,
        minChildSize: 0.5,
        builder: (context, scrollController) {
          return Container(
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
                    const SizedBox(height: 10),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) => ingredients(context),
                    ),
                    const PlaceDivider(),
                    Text(
                      "Route",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) => steps(context, index),
                    ),
                    SizedBox(
                      height: 500,
                      child: GoogleMap(
                        onMapCreated: (controller) {
                          mapController = controller;
                        },
                        initialCameraPosition: CameraPosition(
                            target: LatLng(widget.place.coordinate!.latitude,
                                widget.place.coordinate!.longitude),
                            zoom: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  ingredients(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text("${widget.place.coordinate!.latitude}"),
          const CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xFFE3FFF8),
            child: Icon(
              Icons.done,
              size: 15,
              color: primary,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "4 Eggs",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  steps(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: mainText,
            radius: 12,
            child: Text("${index + 1}"),
          ),
          Column(
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: mainText),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/images/author.png",
                height: 155,
                width: 270,
              )
            ],
          )
        ],
      ),
    );
  }
}
