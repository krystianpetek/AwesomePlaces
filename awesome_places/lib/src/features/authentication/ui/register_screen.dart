import 'package:awesome_places/src/widgets/fade_animation.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: FadeAnimation(
              delay: 1000,
              opacity: 1,
              child: Text(
                'register',
                style: TextStyle(color: Colors.red),
              )),
        ));
  }
}
