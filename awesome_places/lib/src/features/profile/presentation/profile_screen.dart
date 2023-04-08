import 'package:awesome_places/src/features/authentication/data/providers/authentication_provider.dart';
import 'package:awesome_places/src/features/authentication/ui/widgets/show_modal_bottom.dart';
import 'package:awesome_places/src/features/settings/data/api_endpoints.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:awesome_places/src/widgets/circle_image.dart';
import 'package:awesome_places/src/widgets/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

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
              duration: 1000,
              child: buildProfile(),
            ),
            Expanded(
              child: buildMenu(read),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenu(AuthenticationNotifier authenticationNotifier) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        buildDarkModeSwitch(),
        FadeAnimation(
          delay: 300,
          duration: 1000,
          child: ListTile(
            title: const Text('Help center - author GitHub'),
            onTap: () async {
              launchBrowser(uri: ApiEndpoints.developerProfile);
            },
          ),
        ),
        FadeAnimation(
          delay: 500,
          duration: 1000,
          child: ListTile(
            title: const Text('Project repository'),
            onTap: () async {
              launchBrowser(uri: ApiEndpoints.projectRepository);
            },
          ),
        ),
        FadeAnimation(
          delay: 700,
          duration: 1000,
          child: ListTile(
            title: const Text('Awesome Places API'),
            onTap: () async {
              launchBrowser(uri: ApiEndpoints.projectApiOAS);
            },
          ),
        ),
        FadeAnimation(
          delay: 900,
          duration: 1000,
          child: ListTile(
            title: const Text('Notifications'),
            onTap: () async {
              await showModal(text: "This feature isn't implemented yet!");
            },
          ),
        ),
        FadeAnimation(
          delay: 1100,
          duration: 1000,
          child: ListTile(
            title: const Text('My account'),
            onTap: () async {
              await showModal(text: "This feature isn't implemented yet!");
            },
          ),
        ),
        FadeAnimation(
          delay: 1300,
          duration: 1000,
          child: ListTile(
            title: const Text('Log out'),
            onTap: () {
              authenticationNotifier.logout();
            },
          ),
        ),
      ],
    );
  }

  Widget buildDarkModeSwitch() {
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
      children: const [
        CircleImage(
          imageRadius: 60,
          imageProvider: AssetImage('assets/images/author.png'),
        ),
        SizedBox(height: 16),
        Text(
          "Krystian Petek",
          style: TextStyle(fontSize: 21),
        ),
        Text("Developer"),
      ],
    );
  }

  Future<void> showModal({required String text}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ShowModalBottom(text: text);
      },
    );
  }

  Future<void> launchBrowser({required Uri uri}) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
