import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandLogo extends StatelessWidget {
  double? height;
  double? radius;

  BrandLogo({super.key, this.height = 80, this.radius = 50});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: SvgPicture.asset(
        height: height,
        'assets/images/brand_logo.svg',
        color: Color.fromARGB(255, 64, 47, 218),
      ),
    );
  }
}
