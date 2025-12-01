import 'package:flutter_ui_base/common_libs.dart';

class CompassDivider extends StatelessWidget {
  const CompassDivider({
    super.key,
    required this.isExpanded,
    this.duration,
    this.linesColor,
    this.compassColor,
  });

  final bool isExpanded;
  final Duration? duration;
  final Color? linesColor;
  final Color? compassColor;

  @override
  Widget build(BuildContext context) {
    Duration duration = this.duration ?? 1500.animateMs;
    Widget buildHzAnimatedDivider({bool alignLeft = false}) {
      return TweenAnimationBuilder<double>(
        duration: duration,
        tween: Tween(begin: 0, end: isExpanded ? 1 : 0),
        curve: Curves.easeOut,
        child: Divider(
          height: 1,
          thickness: .5,
          color: linesColor ?? $colors.secondaryLight,
        ),
        builder: (_, value, child) {
          return Transform.scale(
            scaleX: value,
            alignment: alignLeft ? Alignment.centerLeft : Alignment.centerRight,
            child: child!,
          );
        },
      );
    }

    return Row(
      children: [
        Expanded(child: buildHzAnimatedDivider()),
        Gap($insets.sm),
        TweenAnimationBuilder<double>(
          duration: duration,
          tween: Tween(begin: 0, end: isExpanded ? .5 : 0),
          curve: Curves.easeOutBack,
          builder: (_, value, child) =>
              Transform.rotate(angle: value * pi * 2, child: child),
          child: Icon(
            Icons.explore,
            size: $sizes.iconLg,
            color: compassColor ?? $colors.secondaryLight,
          ),
        ),
        Gap($insets.sm),
        Expanded(child: buildHzAnimatedDivider(alignLeft: true)),
      ],
    );
  }
}
