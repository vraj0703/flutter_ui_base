import 'package:flutter/material.dart';

class AppSnackBarAlert {
  static SnackBar makeSnackBarToastWidget(BuildContext context,
      {required String title, required String message}) {
    return SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        content: SizedBox(
          height: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white, fontSize: 14),
                ),
              ),
              const SizedBox(height: 8),
              Text(message),
            ],
          ),
        ));
  }
}
