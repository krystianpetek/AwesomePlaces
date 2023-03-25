import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.white,
      child: SvgPicture.asset(
        height: 80,
        'assets/images/brand_logo.svg',
        color: Color.fromARGB(255, 64, 47, 218),
      ),
    );
  }
}
