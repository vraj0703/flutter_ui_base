import 'dart:ui';

import 'package:flutter/material.dart';

class BaseBlurWidget extends StatelessWidget {
  final Widget child;

  const BaseBlurWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: child,
      ),
    );
  }
}
