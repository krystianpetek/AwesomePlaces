import 'package:awesome_places/src/widgets/snackbar_messages/error_message.dart';
import 'package:awesome_places/src/widgets/snackbar_messages/success_message.dart';
import 'package:flutter/material.dart';

class MessageSnackBar {
  static buildErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: ErrorMessage(message: message),
        backgroundColor: Colors.black45,
        behavior: SnackBarBehavior.fixed,
        elevation: 0,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static buildSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SuccessMessage(message: message),
        backgroundColor: Colors.black45,
        behavior: SnackBarBehavior.fixed,
        elevation: 0,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

abstract class CustomSnackBar {}
