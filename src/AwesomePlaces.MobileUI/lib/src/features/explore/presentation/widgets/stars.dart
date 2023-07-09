import 'dart:math';

import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final double rating;
  const Stars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Row(
          children: [
            ...buildStars(),
            Text(
              '$rating',
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              ' (${Random().nextInt(1000)})',
              style: TextStyle(color: Colors.white38, fontSize: 12),
            )
          ],
        );
      },
    );
  }

  List<Container> buildStars() {
    List<Container> containers = [];

    for (int i = 1; i <= 5; i++) {
      if (rating >= i) {
        containers.add(
          Container(
            margin: const EdgeInsets.only(right: 3),
            child: const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 15,
            ),
          ),
        );
      } else {
        containers.add(
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon(
              Icons.star,
              color: Colors.grey,
              size: 15,
            ),
          ),
        );
      }
    }
    return containers;
  }
}
