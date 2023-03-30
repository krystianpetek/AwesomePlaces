import 'package:flutter/material.dart';

class FadeTweenAnimation extends StatelessWidget {
  final Widget child;

  /// Animation in milliseconds
  final Duration delay;
  final double opacity;
  const FadeTweenAnimation({
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
        duration: delay,
        builder: (BuildContext context, double opacity, Widget? child) {
          return Opacity(opacity: opacity, child: SizedBox(child: this.child));
        });
  }
}

class FadeAnimation extends StatefulWidget {
  final Widget child;
  const FadeAnimation({super.key, required this.child});

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<double> _animation =
      Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Future<String> _calculation = Future<String>.delayed(
      const Duration(seconds: 5),
      () => 'Data Loaded',
    );

    return Container(
      child: FutureBuilder(
        builder: (context, snapshot) {
          return Container(
            color: Colors.white,
            child: FadeTransition(
              opacity: _animation,
              child: const Padding(
                  padding: EdgeInsets.all(8), child: FlutterLogo()),
            ),
          );
        },
        future: _calculation,
      ),
    );
  }
}
