import 'package:awesome_places/src/providers/places/models/place_state_model.dart';
import 'package:awesome_places/src/providers/places/places_provider.dart';
import 'package:awesome_places/src/features/explore/presentation/widgets/stars.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlaceFullScreen extends ConsumerStatefulWidget {
  const PlaceFullScreen({super.key});

  @override
  ConsumerState<PlaceFullScreen> createState() => _PlaceFullScreenState();
}

class _PlaceFullScreenState extends ConsumerState<PlaceFullScreen> {
  late PageController pageController;
  late int totalPage;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    )..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PlaceStateModel placeNotifier = ref.watch(placesProvider);
    totalPage = placeNotifier.places.length;
    return Scaffold(
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
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        physics: const RangeMaintainingScrollPhysics(),
        itemBuilder: (context, index) {
          return makePage(
              item: placeNotifier.places[index],
              description: placeNotifier.places[index].description,
              image: placeNotifier.places[index].image,
              page: index + 1,
              title: placeNotifier.places[index].name);
        },
        itemCount: placeNotifier.places.length,
      ),
    );
  }

  Widget makePage({image, title, description, page, item}) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: MemoryImage(image), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.3),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      page.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '/$totalPage',
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            height: 1.2,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Stars(rating: item.rating),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          description,
                          style: TextStyle(
                              color: Colors.white.withOpacity(.7),
                              height: 1.9,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        child: const Text(
                          'READ MORE',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          context.pushNamed(Routes.place.name, extra: item);
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
