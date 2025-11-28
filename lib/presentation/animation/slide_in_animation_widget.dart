import 'package:flutter/material.dart';

/// SlideInTransitionWidget is a wrapper widget that will automatically slide your widget in from left -> right
/// You can wrap any widget you want to slide in, just provide the duration and the animation will happen on the first
/// render.
/// If you wrap this within a BLoC, and render a new state which rebuilds the widget tree, this animation WILL repeat,
/// so use with caution
class SlideInTransitionWidget extends StatefulWidget {
  final Widget widget;
  final Duration duration;
  const SlideInTransitionWidget(
      {super.key, required this.widget, required this.duration});

  @override
  SlideInTransitionWidgetState createState() =>
      SlideInTransitionWidgetState();
}

class SlideInTransitionWidgetState extends State<SlideInTransitionWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: widget.widget);
  }
}
