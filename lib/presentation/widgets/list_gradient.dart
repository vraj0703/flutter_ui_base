import 'package:flutter_ui_base/common_libs.dart';

import 'gradient_container.dart';

/// Used for situations where the list content should blend into a background color.
/// Can be placed at the top or bottom of a list, using the `flip' option when on the bottom
class ListOverscrollGradient extends StatelessWidget {
  const ListOverscrollGradient({
    super.key,
    this.size = 100,
    this.color,
    this.bottomUp = false,
  });

  final bool bottomUp;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? $colors.black;
    return VtGradient(
      [
        c.withValues(alpha: bottomUp ? 0 : 1),
        c.withValues(alpha: bottomUp ? 1 : 0),
      ],
      const [0, 1],
      height: size,
    );
  }
}
