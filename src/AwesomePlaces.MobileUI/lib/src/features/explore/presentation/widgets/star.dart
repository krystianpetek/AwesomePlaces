import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  const Star({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star_border,
      color: Colors.yellow,
      size: 16,
    );
  }
}
