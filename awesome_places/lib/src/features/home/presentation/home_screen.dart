import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(width: 50),
                Text("Awesome Places"),
              ],
            )
          ],
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white70),
              // gradient: LinearGradient(colors: Colors.primaries),
              image: const DecorationImage(
                image: AssetImage('assets/images/author.png'),
              ),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.grey,
                )
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                context.goNamed(Routes.profile.name);
              },
            ),
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "HomeScreen",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
