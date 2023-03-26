import 'package:awesome_places/src/features/auth/data/auth_provider.dart';
import 'package:awesome_places/src/routes/constants.dart';
import 'package:awesome_places/src/widgets/redirect_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, this.username});

  final String? username;

  final Color logoColor = const Color.fromARGB(255, 40, 105, 245);
  final TextStyle focusedStyle = const TextStyle(color: Colors.green);
  final TextStyle unfocusedStyle = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
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
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
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
                            await showModal(context,
                                reason: 'Login by Facebook');
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
                            await showModal(context, reason: 'Login by Google');
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(7),
                            child: Icon(FontAwesomeIcons.google, size: 30),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    buildInputField(label: 'Email'),
                    const SizedBox(height: 20),
                    buildInputField(label: 'Password', obscureText: true),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            child: const Text('Forgot password?'),
                            onTap: () async {
                              await showModal(context);
                            })
                      ],
                    ),
                    const SizedBox(height: 50),
                    RedirectButton(
                      onClick: () {
                        ref
                            .read(authNotifierProvider)
                            .login('login', 'password');
                        context.goNamed(Routes.home.name);
                      },
                      text: 'Login',
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account?"),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () async {
                            await showModal(context);
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
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
    });
  }

  Future showModal(BuildContext context, {String reason = 'This feature'}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Sorry!', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 5),
            Text(
              '$reason not implemented yet!',
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Close'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => logoColor),
                  foregroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.white)),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ]),
        );
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

  Widget buildInputField({label, obscureText = false}) {
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

  // ThemeData darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   backgroundColor: bodyColorDark,
  //   scaffoldBackgroundColor: bodyColorDark,
  //   hintColor: textColor,
  //   primaryColorLight: buttonBackgroundColorDark,
  //   textTheme: TextTheme(
  //       headline1: TextStyle(
  //           color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
  //   buttonTheme: ButtonThemeData(
  //       textTheme: ButtonTextTheme.primary, buttonColor: Colors.white),
  // );

  // ThemeData lightTheme = ThemeData(
  //   brightness: Brightness.light,
  //   backgroundColor: bodyColor,
  //   scaffoldBackgroundColor: bodyColor,
  //   hintColor: textColor,
  //   primaryColorLight: buttonBackgroundColor,
  //   textTheme: TextTheme(
  //     headline1: TextStyle(
  //         color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
  //   ),
  //   buttonTheme: ButtonThemeData(
  //       textTheme: ButtonTextTheme.primary, buttonColor: Colors.black),
  // );
  // static Color textColor = const Color(0xff9C9C9D);
  // static Color textColorDark = const Color(0xffffffff);

  // static Color bodyColor = const Color(0xffffffff);
  // static Color bodyColorDark = const Color(0xff0E0E0F);

  // static Color buttonBackgroundColor = const Color(0xffF7F7F7);
  // static Color buttonBackgroundColorDark = const Color(0xff121212);

  // @override
  // Widget build(BuildContext context) {
  //   final size = MediaQuery.of(context).size;

  //   return Scaffold(
  //     body: SingleChildScrollView(
  //         child: Container(
  //       width: size.width,
  //       height: size.height,
  //       color: lightTheme.backgroundColor,
  //       padding: EdgeInsets.only(left: 20, right: 20, top: 150, bottom: 80),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           Text(
  //             "hello",
  //             style: lightTheme.textTheme.headline1,
  //           ),
  //           Column(
  //             children: [
  //
  //               Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
  //                 decoration: BoxDecoration(
  //                     color: lightTheme.primaryColorLight,
  //                     borderRadius: BorderRadius.all(Radius.circular(20))),
  //                 child: TextField(
  //                   decoration: InputDecoration(
  //                       border: InputBorder.none,
  //                       hintText: 'email or phone number',
  //                       hintStyle: TextStyle(color: Colors.amber)),
  //                 ),
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     )),
  //   );
  // }
}
