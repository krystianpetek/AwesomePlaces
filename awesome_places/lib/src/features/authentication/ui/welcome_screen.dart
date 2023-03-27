import 'package:awesome_places/src/routes/models/routes.dart';
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      const Text(
                        'Welcome!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                  const SizedBox(height: 20),
                  Column(
                    children: const <Widget>[
                      BrandLogo(),
                      SizedBox(height: 30),
                      BrandName(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(children: [
                    RedirectButton(
                      onClick: () {
                        context.goNamed(Routes.login.name);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RedirectButton(
                      onClick: () {
                        context.goNamed(Routes.register.name);
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ]),
                ],
              ))),
    );
  }
}
