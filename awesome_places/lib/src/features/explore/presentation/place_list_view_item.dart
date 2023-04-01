import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:flutter/material.dart';

class PlaceListViewItem extends StatefulWidget {
  PlaceListViewItem({super.key, required this.place});
  final Place place;

  @override
  State<PlaceListViewItem> createState() => _PlaceListViewItemState();
}

class _PlaceListViewItemState extends State<PlaceListViewItem> {
  double opacity = 0.4;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          opacity = 0;
        });
      },
      onExit: (event) {
        setState(() {
          opacity = 0.4;
        });
      },
      child: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(opacity), BlendMode.darken),
                  filterQuality: FilterQuality.high,
                  opacity: 0.5,
                  image: MemoryImage(widget.place.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 5,
                    right: 10,
                    child: Text(widget.place.address!.country,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                )),
                  ),
                  Positioned(
                    top: 5,
                    left: 10,
                    child: Text(widget.place.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                          child: ClipRRect(
                        child: Row(
                          children: [
                            const Icon(Icons.location_on_outlined),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("X: ${widget.place.coordinate!.latitude}"),
                                Text(
                                    "Y: ${widget.place.coordinate!.longitude}"),
                              ],
                            ),
                          ],
                        ),
                      ))),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
              child: Text(
                widget.place.description,
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
