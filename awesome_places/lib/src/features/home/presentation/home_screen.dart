import 'package:awesome_places/src/features/auth/data/auth_provider.dart';
import 'package:awesome_places/src/widgets/redirect_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final AuthNotifier read = ref.read(authNotifierProvider);
        return Center(
          child: Column(
            children: [
              Text("home"),
              RedirectButton(
                  onClick: () {
                    read.logout();
                  },
                  text: 'logout')
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        );
      },
    );
  }
}
