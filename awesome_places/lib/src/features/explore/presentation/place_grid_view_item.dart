import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlaceGridViewItem extends StatefulWidget {
  const PlaceGridViewItem({super.key, required this.place});
  final Place place;

  @override
  State<PlaceGridViewItem> createState() => _PlaceGridViewItemState();
}

class _PlaceGridViewItemState extends State<PlaceGridViewItem> {
  double opacity = 0.3;

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
          opacity = 0.3;
        });
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.place.name, extra: widget.place);
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2 - 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(opacity), BlendMode.darken),
                  filterQuality: FilterQuality.high,
                  opacity: 0.5,
                  image: MemoryImage(widget.place.image),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.place.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 10,
                    child: Text(
                      widget.place.address!.country,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
