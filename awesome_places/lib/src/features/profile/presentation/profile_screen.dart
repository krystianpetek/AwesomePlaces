import 'package:awesome_places/src/features/authentication/data/providers/authentication_provider.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:awesome_places/src/widgets/circle_image.dart';
import 'package:awesome_places/src/widgets/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => ProfileScreenState();
  bool darkMode = true;
}

class ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier read =
        ref.read(authenticationProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Navigator.pop(context);
            context.goNamed(Routes.home.name);
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            FadeAnimation(
              delay: 100,
              child: buildProfile(),
              duration: 1000,
            ),
            Expanded(child: buildMenu(read))
          ],
        ),
      ),
    );
  }

  Widget buildMenu(AuthenticationNotifier authenticationNotifier) {
    return ListView(
      children: [
        buildDarkModeRow(),
        ListTile(
          title: const Text('Mock data'),
          onTap: () async {},
        ),
        ListTile(
          title: const Text('Menu item'),
          onTap: () async {},
        ),
        ListTile(
          title: const Text('Menu item'),
          onTap: () async {},
        ),
        ListTile(
          title: const Text('Menu item'),
          onTap: () async {},
        ),
        ListTile(
          title: const Text('Menu item'),
          onTap: () async {},
        ),
        ListTile(
          title: const Text('Menu item'),
          onTap: () async {},
        ),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
            authenticationNotifier.logout();
          },
        ),
      ],
    );
  }

  Widget buildDarkModeRow() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
            value: widget.darkMode,
            onChanged: (value) {
              setState(() {
                widget.darkMode = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildProfile() {
    return Column(
      children: [
        CircleImage(
          imageRadius: 60,
          imageProvider: AssetImage('assets/images/author.png'),
        ),
        const SizedBox(height: 16),
        Text(
          "Krystian Petek",
          style: const TextStyle(fontSize: 21),
        ),
        Text(".NET Developer"),
      ],
    );
  }
}
