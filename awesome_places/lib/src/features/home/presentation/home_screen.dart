import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("HomeScreen", style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
