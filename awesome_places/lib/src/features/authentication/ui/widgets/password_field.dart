import 'package:awesome_places/src/features/authentication/data/validators/form_validators.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController textEditingController;

  const PasswordField({
    super.key,
    required this.label,
    this.obscureText = true,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
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
        TextFormField(
          controller: textEditingController,
          validator: (value) {
            if (!value!.isValidPassword) {
              return "Provide a valid password of more than 8 characters!";
            }
          },
          obscureText: obscureText,
          cursorColor: const Color.fromARGB(255, 40, 105, 245),
          keyboardType: TextInputType.emailAddress,
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
            hintText: "Enter password",
            hintStyle: TextStyle(height: 0.5),
          ),
        )
      ],
    );
  }
}