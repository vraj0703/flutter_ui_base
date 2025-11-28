import 'package:flutter_ui_base/common_libs.dart';

class SimpleCheckbox extends StatelessWidget {
  const SimpleCheckbox({
    super.key,
    required this.active,
    required this.onToggled,
    required this.label,
  });

  final bool active;
  final String label;
  final Function(bool? onToggle) onToggled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular($corners.sm)),
          ),
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular($corners.sm),
              ),
            ),
            value: active,
            visualDensity: VisualDensity(horizontal: 0.5, vertical: 0.5),
            checkColor: $colors.black.withValues(alpha: 0.75),
            activeColor: $colors.white.withValues(alpha: 0.75),
            onChanged: (bool? active) {
              AppHaptics.mediumImpact();
              onToggled.call(active);
            },
          ),
        ),
        Gap($insets.xs),
        Text(
          label,
          style: $textStyle.bodyLarge.copyWith(
            color: $colors.offWhite,
          ),
        ),
      ],
    );
  }
}
