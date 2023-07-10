import 'package:awesome_places/src/providers/authentication/authentication_provider.dart';
import 'package:awesome_places/src/features/authentication/presentation/widgets/widgets.dart';
import 'package:awesome_places/src/features/settings/data/api_endpoints.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:awesome_places/src/widgets/approve_button.dart';
import 'package:awesome_places/src/widgets/snackbar_messages/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:awesome_places/src/features/authentication/data/models/models.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  LoginScreen({super.key});
  bool loading = false;

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authenticationNotifier = ref.watch(authenticationProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Login to your account',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      onTap: () async {
                        await showModal(
                          text: "Login by Facebook isn't implemented yet!",
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(7),
                        child: Icon(FontAwesomeIcons.facebook, size: 30),
                      ),
                    ),
                    const SizedBox(width: 30),
                    InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      onTap: () async {
                        await showModal(
                          text: "Login by Google isn't implemented yet!",
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(7),
                        child: Icon(FontAwesomeIcons.google, size: 30),
                      ),
                    ),
                  ],
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    children: [
                      EmailField(
                        textEditingController: emailController,
                        label: 'Email',
                      ),
                      const SizedBox(height: 20),
                      PasswordField(
                        label: 'Password',
                        textEditingController: passwordController,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        child: const Text('Forgot password?'),
                        onTap: () async {
                          await showModal(
                              text:
                                  "This feature isn't implemented yet!\nI will fill login data for you.");
                          emailController.text = ApiEndpoints.username;
                          passwordController.text = ApiEndpoints.passwd;
                        })
                  ],
                ),
              ],
            ),
            Column(
              children: [
                widget.loading
                    ? ApproveButton(
                        onClick: () {},
                        child: const CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      )
                    : ApproveButton(
                        onClick: () async {
                          setState(() {
                            widget.loading = true;
                            // loading should will be move to authenticate state
                          });

                          await authenticationNotifier.login(
                            LoginModel(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                          if (authenticationNotifier
                              .state.errorMessage.isNotEmpty) {
                            // ignore: use_build_context_synchronously
                            MessageSnackBar.buildErrorSnackbar(
                              context,
                              authenticationNotifier.state.errorMessage,
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            MessageSnackBar.buildSuccessSnackBar(
                              context,
                              'Authenticated successfully.',
                            );
                          }
                          setState(() {
                            widget.loading = false;
                          });
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Don't have an account?"),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        context.goNamed(Routes.register.name);
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future showModal({required String text}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ShowModalBottom(text: text);
      },
    );
  }
}
