import 'package:awesome_places/src/routes/constants.dart';
import 'package:awesome_places/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, this.username});

  final String? username;

  final Color logoColor = const Color.fromRGBO(64, 143, 77, 1);
  final TextStyle focusedStyle = const TextStyle(color: Colors.green);
  final TextStyle unfocusedStyle = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  BrandLogo(),
                  SizedBox(
                    height: 30,
                  ),
                  BrandName()
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.facebook,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Icon(
                        FontAwesomeIcons.google,
                        size: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  const SizedBox(height: 50),
                  buildTextField(username ?? 'username'),
                  const SizedBox(height: 16),
                  buildTextField('password'),
                  const SizedBox(height: 16),
                  buildButton(context),
                ],
              )
            ],
          ),
        ),
      ),
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
            color: Colors.green,
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
