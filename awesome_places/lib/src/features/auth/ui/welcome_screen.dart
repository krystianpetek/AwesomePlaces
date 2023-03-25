import 'package:awesome_places/src/routes/constants.dart';
import 'package:awesome_places/src/widgets/redirect_button.dart';
import 'package:awesome_places/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text(
                        'Welcome!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: const <Widget>[
                          BrandLogo(),
                          SizedBox(height: 30),
                          BrandName(),
                        ],
                      ),
                      Text(
                        'Log in or create an account to continue',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(children: [
                    RedirectButton(
                        onClick: () {
                          context.goNamed(Routes.login.name);
                        },
                        text: Routes.login.name),
                    RedirectButton(
                        onClick: () {
                          context.goNamed(Routes.register.name);
                        },
                        text: Routes.register.name),
                  ]),
                ],
              ))),
    );
  }
}
