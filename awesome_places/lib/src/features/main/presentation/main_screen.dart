import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:awesome_places/src/features/main/data/models/named_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({
    super.key,
    required this.title,
    required this.screen,
  });
  final String title;
  final Widget screen;

  final tabs = [
    NamedNavigationBarItemWidget(
      initialLocation: Routes.home.path,
      icon: const Icon(Icons.home),
      label: 'Home',
    ),
    NamedNavigationBarItemWidget(
        initialLocation: Routes.explore.path,
        icon: const Icon(Icons.explore),
        label: 'Explore'),
    // NamedNavigationBarItemWidget(
    //   initialLocation: Routes.profile.path,
    //   icon: const Icon(Icons.person),
    //   label: 'Profile',
    // ),
    NamedNavigationBarItemWidget(
      initialLocation: Routes.settings.path,
      icon: const Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int locationToTabIndex(String location) {
      final index =
          tabs.indexWhere((t) => location.startsWith(t.initialLocation));
      return index < 0 ? 0 : index; // if index not found (-1), return 0
    }

    int currentIndex = locationToTabIndex(GoRouter.of(context).location);
    void onItemTapped(BuildContext context, int tabIndex) {
      if (tabIndex != currentIndex) {
        context.go(tabs[tabIndex]
            .initialLocation); // go to the initial location of the selected tab (by index)
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Container(
              child: GestureDetector(
                onTap: () {
                  context.goNamed(Routes.profile.name);
                },
              ),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white70),
                  // gradient: LinearGradient(colors: Colors.primaries),
                  image: DecorationImage(
                    image: AssetImage('assets/images/author.png'),
                  ),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      blurRadius: 3,
                      color: Colors.grey,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5)))),
          Padding(
            padding: EdgeInsets.only(right: 40),
          )
        ],
      ),
      body: screen,
      bottomNavigationBar: BottomNavigationBar(
        items: tabs,
        onTap: (value) => onItemTapped(context, value),
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
