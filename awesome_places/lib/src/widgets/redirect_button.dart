import 'package:flutter/material.dart';

class RedirectButton extends StatelessWidget {
  final Function onClick;
  final String text;

  const RedirectButton({super.key, required this.onClick, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 3, left: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).colorScheme.background)),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () {
          onClick();
        },
        // color: Theme.of(context).colorScheme.secondaryContainer,
        // color: const Color(0xff402fda),
        color: Color.fromARGB(255, 47, 87, 218),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
      ),
    );
  }
}
