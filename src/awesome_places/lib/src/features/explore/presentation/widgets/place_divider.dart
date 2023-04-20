import 'package:flutter/material.dart';

class PlaceDivider extends StatelessWidget {
  const PlaceDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Divider(height: 4),
    );
  }
}
