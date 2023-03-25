import 'package:flutter/material.dart';

class FadeAnimation extends AnimatedWidget {
  final Widget child;
  final AnimationController controller;

  const FadeAnimation(
      {super.key, required this.child, required this.controller})
      : super(listenable: controller);

  Animation<double> get _progress => CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FadeTransition(
        opacity: _progress,
        child: child,
      )
    ]);
  }
}
