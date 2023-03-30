import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandLogo extends StatelessWidget {
  double? height;

  BrandLogo({super.key, this.height = 80});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.white,
      child: SvgPicture.asset(
        height: height,
        'assets/images/brand_logo.svg',
        color: Color.fromARGB(255, 64, 47, 218),
      ),
    );
  }
}
