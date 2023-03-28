import 'package:awesome_places/src/features/authentication/ui/widgets/widgets.dart';
import 'package:awesome_places/src/widgets/redirect_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Register",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text("Create an account in my app",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15,
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  EmailField(
                      label: "Email", textEditingController: emailController),
                  const SizedBox(height: 20),
                  PasswordField(
                      label: "Password",
                      obscureText: true,
                      textEditingController: passwordController),
                  const SizedBox(height: 20),
                  PasswordField(
                      label: "Confirm Password",
                      obscureText: true,
                      textEditingController: confirmPasswordController),
                ],
              ),
              ApproveButton(
                onClick: () {},
                child: Text(
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
                    onTap: () async {
                      await showModal(
                          text: "This feature isn't implemented yet!");
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
