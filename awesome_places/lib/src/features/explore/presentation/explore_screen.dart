import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/features/explore/data/services/places_service.dart';
import 'package:awesome_places/src/widgets/redirect_button.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late List<Place> data = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("explore"),
          RedirectButton(
              onClick: () async {
                data = await PlacesService().getPlaces();
                setState(() {});
              },
              text: 'Fetch'),
          SizedBox(
            height: 500,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(data[index].id),
                      Text(data[index].description),
                      Text(data[index].address!.country),
                      Text(data[index].address!.city),
                      Image.memory(data[index].image),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 50);
                },
                itemCount: data.length),
          ),
        ],
      ),
    );
  }
}
