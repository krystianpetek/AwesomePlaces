import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandName extends StatelessWidget {
  const BrandName({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/brand_name.svg',
      height: 30,
      color: Color.fromARGB(255, 40, 105, 245),
    );
  }
}
