import 'package:awesome_places/src/features/authentication/ui/widgets/widgets.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:awesome_places/src/widgets/approve_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  RegisterScreen({super.key});
  bool loading = false;

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  "Register",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Create an account in my app",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      EmailField(
                          label: "Email",
                          textEditingController: emailController),
                      const SizedBox(height: 20),
                      PasswordField(
                          label: "Password",
                          obscureText: true,
                          textEditingController: passwordController),
                      const SizedBox(height: 20),
                      PasswordField(
                          label: "Confirm password",
                          hintText: "Confirm password",
                          obscureText: true,
                          textEditingController: confirmPasswordController),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                widget.loading
                    ? ApproveButton(
                        onClick: () {},
                        child: const CircularProgressIndicator(),
                      )
                    : ApproveButton(
                        onClick: () {},
                        child: const Text(
                          "Register",
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
                    const Text("Already have an account?"),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        context.goNamed(Routes.login.name);
                      },
                      child: const Text(
                        "Login",
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
    confirmPasswordController.dispose();
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
