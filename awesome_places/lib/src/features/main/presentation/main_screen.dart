import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:awesome_places/src/features/main/data/models/named_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({
    super.key,
    // required this.title,
    required this.screen,
  });
  // final String title;
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
    NamedNavigationBarItemWidget(
      initialLocation: Routes.profile.path,
      icon: const Icon(Icons.person),
      label: 'Profile',
    ),
    NamedNavigationBarItemWidget(
      initialLocation: Routes.settings.path,
      icon: const Icon(Icons.settings),
      label: 'Setting',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int _locationToTabIndex(String location) {
      final index =
          tabs.indexWhere((t) => location.startsWith(t.initialLocation));
      // if index not found (-1), return 0
      return index < 0 ? 0 : index;
    }

    int _currentIndex = _locationToTabIndex(GoRouter.of(context).location);
    void _onItemTapped(BuildContext context, int tabIndex) {
      if (tabIndex != _currentIndex) {
        // go to the initial location of the selected tab (by index)
        context.go(tabs[tabIndex].initialLocation);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: screen,
      bottomNavigationBar: BottomNavigationBar(
        items: tabs,
        onTap: (value) => _onItemTapped(context, value),
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
