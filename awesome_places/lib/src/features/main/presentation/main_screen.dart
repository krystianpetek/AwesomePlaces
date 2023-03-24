import 'package:awesome_places/src/features/explore/presentation/explore_screen.dart';
import 'package:awesome_places/src/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key, required this.title, required this.currentTab});
  final String title;
  int currentTab;
  List<BottomNavigationBarItem> pages = <BottomNavigationBarItem>[
    BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: "Explore", icon: Icon(Icons.explore))
  ];
  Map<int, Widget> screens = {0: HomeScreen(), 1: ExploreScreen()};

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widget.screens[widget.currentTab],
      bottomNavigationBar: BottomNavigationBar(
        items: widget.pages,
        currentIndex: widget.currentTab,
        onTap: (index) {
          context.goNamed('main', params: {'tab': '$index'});
        },
      ),
      // floatingActionButton: FloatingActionButton(),
    );
  }
}
