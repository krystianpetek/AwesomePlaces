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
      initialLocation: Routes.search.path,
      icon: const Icon(Icons.search_outlined),
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
