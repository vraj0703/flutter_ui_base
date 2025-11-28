import 'package:flutter/material.dart';
import 'package:flutter_ui_base/internal_exports.dart';

class AppSnackBar {
  final Color? color;
  final IconData? icon;
  final String message;
  final TextStyle msgStyle;
  final SnackBarBehavior behavior;

  AppSnackBar({
    required this.message,
    required this.msgStyle,
    this.color,
    this.icon,
    this.behavior = SnackBarBehavior.floating,
  });

  static void show(
    BuildContext context, {
    String? message,
    TextStyle? style,
    Color? color,
    IconData? icon,
    Color? iconColor,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsets? margin = const EdgeInsets.all(0),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          key: const Key('app_snackbar'),
          backgroundColor: (color != null) ? color : $colors.offWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          behavior: behavior,
          margin: margin,
          content: (icon != null)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 24, color: iconColor ?? style!.color),
                    const SizedBox(width: 16),
                    Flexible(child: Text(message!, style: style)),
                  ],
                )
              : Text(message!, style: style),
        ),
      );
  }
}
