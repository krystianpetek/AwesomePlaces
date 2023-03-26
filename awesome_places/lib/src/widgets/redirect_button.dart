import 'package:flutter/material.dart';

class RedirectButton extends StatelessWidget {
  final Function onClick;
  Widget child;

  RedirectButton({super.key, required this.onClick, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Theme.of(context).colorScheme.background)),
      child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: () async {
            await onClick();
          },
          // color: Theme.of(context).colorScheme.secondaryContainer,
          // color: const Color(0xff402fda),
          color: const Color.fromARGB(255, 47, 87, 218),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: child),
    );
  }
}
