import 'package:flutter/material.dart';
import 'package:awesome_places/src/features/authentication/data/validators/form_validators.dart';

class EmailField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController textEditingController;

  const EmailField({
    super.key,
    required this.label,
    this.obscureText = false,
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
          obscureText: obscureText,
          validator: (value) {
            if (!value!.isValidEmail) {
              return "Enter valid email!";
            }
          },
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
            hintText: "Enter an address email",
            hintStyle: TextStyle(height: 0.5),
          ),
        )
      ],
    );
  }
}
