import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedGradientArc extends StatefulWidget {
  final Duration duration;
  final CustomPainter? Function(BuildContext context, double animationValue)
      builder;

  const AnimatedGradientArc({
    super.key,
    required this.duration,
    required this.builder,
  });

  @override
  AnimatedGradientArcState createState() => AnimatedGradientArcState();
}

class AnimatedGradientArcState extends State<AnimatedGradientArc>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 1.0 && !_isVisible) {
          _isVisible = true;
          _startAnimation();
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return CustomPaint(
            painter: widget.builder(context, _animation.value),
          );
        },
      ),
    );
  }
}
