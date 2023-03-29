import 'package:flutter/material.dart';

class ShowModalBottom extends StatelessWidget {
  final String text;

  const ShowModalBottom({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Sorry!',
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => const Color.fromARGB(255, 40, 105, 245),
            ),
            foregroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
        )
      ]),
    );
  }
}
