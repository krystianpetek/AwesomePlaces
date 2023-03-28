import 'package:awesome_places/src/features/authentication/data/providers/authentication_provider.dart';
import 'package:awesome_places/src/features/authentication/ui/widgets/widgets.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:awesome_places/src/widgets/redirect_button.dart';
import 'package:awesome_places/src/widgets/snackbar_messages/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:awesome_places/src/features/authentication/data/models/models.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  LoginScreen({super.key, this.username});

  final String? username;
  bool loading = false;

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final Color logoColor = const Color.fromARGB(255, 40, 105, 245);
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
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: [
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        onTap: () async {
                          await showModal(
                              text: "Login by Facebook isn't implemented yet!");
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(7),
                          child: Icon(FontAwesomeIcons.facebook, size: 30),
                        ),
                      ),
                      const SizedBox(width: 30),
                      InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        onTap: () async {
                          await showModal(
                              text: "Login by Google isn't implemented yet!");
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(7),
                          child: Icon(FontAwesomeIcons.google, size: 30),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          child: const Text('Forgot password?'),
                          onTap: () async {
                            await showModal(
                                text: "This feature isn't implemented yet!");
                            await showModal(
                              text: "I fill login data for you.",
                            );
                            emailController.text = 'userMock@email.com';
                            passwordController.text = 'defaultPass';
                            // komunikat o wypełnieniu danymi
                          })
                    ],
                  ),
                  const SizedBox(height: 50),
                  widget.loading
                      ? RedirectButton(
                          onClick: () {},
                          child: const CircularProgressIndicator(),
                        )
                      : RedirectButton(
                          onClick: () async {
                            setState(() {
                              widget.loading = true;
                              // przenieść do auth state
                            });
                            await authenticationNotifier.login(
                              LoginModel(
                                  email: emailController.text,
                                  password: passwordController.text),
                            );

                            if (authenticationNotifier
                                .state.errorMessage.isNotEmpty) {
                              // ignore: use_build_context_synchronously
                              MessageSnackBar.buildErrorSnackbar(context,
                                  authenticationNotifier.state.errorMessage);
                            } else {
                              // ignore: use_build_context_synchronously
                              MessageSnackBar.buildSuccessSnackBar(
                                  context, 'Authenticated successfully.');
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
                        onTap: () async {
                          await showModal(
                              text: "This feature isn't implemented yet!");
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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

  Widget buildButton(BuildContext context) {
    return SizedBox(
      height: 55,
      child: MaterialButton(
        color: logoColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          // Provider.of<AppStateManager>(context, listen: false)
          //     .login('mockUsername', 'mockPassword');
          context.goNamed(Routes.home.name);
        },
      ),
    );
  }

// email field nad password field
// register screen
// validators in fields
// remove build buttons
// move showmodal
  Widget buildInputField(
      {required String label,
      bool obscureText = false,
      required TextEditingController textController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: textController,
          obscureText: obscureText,
          cursorColor: logoColor,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 40, 105, 245),
              ),
            ),
            // hintText: hintText,
            hintStyle: TextStyle(height: 0.5),
          ),
        )
      ],
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      cursorColor: logoColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(height: 0.5),
      ),
    );
  }
}
