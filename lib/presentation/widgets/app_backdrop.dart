import 'dart:ui';

import 'package:flutter_ui_base/common_libs.dart';

class AppBackdrop extends StatelessWidget {
  const AppBackdrop({
    super.key,
    this.strength = 1,
    this.blur = false,
    this.child,
  });

  final double strength;
  final bool blur;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final double normalStrength = clampDouble(strength, 0, 1);
    if (blur) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: normalStrength * 15,
          sigmaY: normalStrength * 15,
        ),
        child: child ?? const SizedBox.expand(),
      );
    }
    final fill = Container(
      color: $colors.black.withValues(alpha: .8 * strength),
    );
    return child == null
        ? fill
        : Stack(
            children: [
              Positioned.fill(child: fill),
              child!,
            ],
          );
  }
}
