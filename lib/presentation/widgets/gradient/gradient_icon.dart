import 'package:flutter/material.dart';
import 'package:my_theme_style/styles/app_icon.dart';
import 'package:my_theme_style/styles/app_icons.dart';

class GradientIcon extends StatelessWidget {
  final AppIcons icon;
  final double size;
  final Gradient gradient;

  const GradientIcon({
    required this.icon,
    required this.size,
    required this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: AppIcon(icon, size: size, color: Colors.white),
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
    );
  }
}
