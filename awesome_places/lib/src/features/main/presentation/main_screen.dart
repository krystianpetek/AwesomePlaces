import 'package:awesome_places/src/routes/constants.dart';
import 'package:awesome_places/src/features/main/data/models/named_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// class MainScreen extends StatefulWidget {

//   @override
//   State<MainScreen> createState() => _MainScreenState();

//   // String currentRoute;

//   // Map<String, int> mapping = <String, int>{'': 0, 'home': 0, 'explore': 1};

//   // List<BottomNavigationBarItem> pages = <BottomNavigationBarItem>[
//   //   BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
//   //   BottomNavigationBarItem(label: "Explore", icon: Icon(Icons.explore))
//   // ];

//   // Map<int, Widget> screens = {0: HomeScreen(), 1: ExploreScreen()};
// }

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
      initialLocation: Routes.home,
      icon: const Icon(Icons.home),
      label: 'Home',
    ),
    NamedNavigationBarItemWidget(
        initialLocation: Routes.explore,
        icon: const Icon(Icons.explore),
        label: 'Explore'),
    NamedNavigationBarItemWidget(
      initialLocation: Routes.profile,
      icon: const Icon(Icons.person),
      label: 'Profile',
    ),
    NamedNavigationBarItemWidget(
      initialLocation: Routes.settings,
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
  // body: widget.screens[widget.mapping],
  // bottomNavigationBar: BottomNavigationBar(
  //   items: widget.pages,
  //   currentIndex: widget.mapping[widget.currentRoute]!,
  //   onTap: (index) {
  //     String route = widget.mapping.keys.elementAt(index);
  //     context.goNamed('main', params: {'taba': route});
  //   },
  // ),
  // floatingActionButton: FloatingActionButton(),
}

// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screen,
//       bottomNavigationBar: _buildBottomNavigation(context, tabs),
//     );
//   }
// }
