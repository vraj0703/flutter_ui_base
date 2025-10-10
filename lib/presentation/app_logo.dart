import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width = 100, required this.logoPath});

  final double width;
  final String logoPath;

  @override
  Widget build(BuildContext context) => Image.asset(
    logoPath,
    excludeFromSemantics: true,
    fit: BoxFit.cover,
    width: width,
    filterQuality: FilterQuality.high,
  );
}
