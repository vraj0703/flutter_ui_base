import 'package:flutter/material.dart';
import 'package:flutter_ui_base/presentation/snackbar/snackbar.dart';

Future<void> showDelayedSnackbar({
  required BuildContext context,
  required String message,
  int delayedInMs = 10,
  Color color = Colors.red,
  IconData? icon,
  Color textColor = Colors.white,
  Color iconColor = Colors.greenAccent,
}) => Future.delayed(Duration(milliseconds: delayedInMs)).then(
  (value) => AppSnackBar.show(
    context,
    message: message,
    color: color,
    icon: icon,
    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor),
    iconColor: iconColor,
    behavior: SnackBarBehavior.floating,
  ),
);
