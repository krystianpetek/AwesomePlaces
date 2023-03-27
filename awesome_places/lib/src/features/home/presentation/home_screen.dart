import 'package:awesome_places/src/features/authentication/data/providers/authentication_provider.dart';
import 'package:awesome_places/src/widgets/redirect_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final AuthenticationNotifier read =
            ref.read(authenticationProvider.notifier);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("home"),
              RedirectButton(
                onClick: () {
                  read.logout();
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
