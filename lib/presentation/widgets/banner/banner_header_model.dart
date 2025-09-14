import 'package:flutter/material.dart';

enum BannerHeaderIconPosition { topLeft, bottomRight, background }

class BannerHeaderModel {
  final Widget icon;
  final BannerHeaderIconPosition iconPosition;
  final String primaryText;
  final String? secondaryText;
  final Color primaryBackgroundColor;
  final Color? secondaryBackgroundColor;
  final Color iconBackgroundColor;
  final TextStyle primaryTextStyle;
  final TextStyle? secondaryTextStyle;
  final double iconSize;
  final BorderRadius borderRadius;
  final EdgeInsets backgroundPadding;
  final Widget? closeIcon;
  final VoidCallback? closeAction;
  final bool isLoading;

  BannerHeaderModel(
      {required this.icon,
      required this.iconPosition,
      required this.primaryText,
      this.secondaryText,
      required this.primaryBackgroundColor,
      required this.secondaryBackgroundColor,
      required this.iconBackgroundColor,
      required this.primaryTextStyle,
      this.secondaryTextStyle,
      required this.iconSize,
      this.borderRadius = BorderRadius.zero,
      required this.backgroundPadding,
      this.closeIcon,
      this.closeAction,
      this.isLoading = false});
}
