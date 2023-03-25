import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RedirectButton extends StatelessWidget {
  final Function onClick;
  final String text;

  const RedirectButton({super.key, required this.onClick, required this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: MaterialButton(
        color: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          onClick();
          // Provider.of<AppStateManager>(context, listen: false)
          //     .login('mockUsername', 'mockPassword');
        },
      ),
    );
  }
}
