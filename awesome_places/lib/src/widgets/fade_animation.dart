import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  final Widget child;

  /// Animation in milliseconds
  final int delay;
  final double opacity;
  const FadeAnimation({
    required this.child,
    required this.delay,
    required this.opacity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: opacity),
        curve: Curves.ease,
        duration: Duration(milliseconds: delay),
        builder: (BuildContext context, double opacity, Widget? child) {
          return Opacity(opacity: opacity, child: SizedBox(child: this.child));
        });
  }
}
