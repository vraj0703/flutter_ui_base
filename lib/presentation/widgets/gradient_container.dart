import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(
    this.colors,
    this.stops, {
    super.key,
    this.child,
    this.width,
    this.height,
    this.alignment,
    this.begin,
    this.end,
    this.blendMode,
    this.borderRadius,
    this.ignorePointer = false,
  });

  final List<Color> colors;
  final List<double> stops;
  final double? width;
  final double? height;
  final Widget? child;
  final Alignment? begin;
  final Alignment? end;
  final Alignment? alignment;
  final BlendMode? blendMode;
  final BorderRadius? borderRadius;
  final bool ignorePointer;

  @override
  Widget build(BuildContext context) {
    final container = Container(
      width: width,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin ?? Alignment.centerLeft,
          end: end ?? Alignment.centerRight,
          colors: colors,
          stops: stops,
        ),
        backgroundBlendMode: blendMode,
        borderRadius: borderRadius,
      ),
      child: child,
    );
    if (ignorePointer) {
      return IgnorePointer(child: container);
    }
    return container;
  }
}

class HzGradient extends GradientContainer {
  const HzGradient(
    super.colors,
    super.stops, {
    super.key,
    super.child,
    super.width,
    super.height,
    super.alignment,
    super.blendMode,
    super.borderRadius,
  });
}

class VtGradient extends GradientContainer {
  const VtGradient(
    super.colors,
    super.stops, {
    super.key,
    super.child,
    super.width,
    super.height,
    super.alignment,
    super.blendMode,
    super.borderRadius,
  }) : super(begin: Alignment.topCenter, end: Alignment.bottomCenter);
}
