import 'package:my_localizations/l10n/app_localizations.dart';
import 'package:my_theme_style/styles/corners.dart';
import 'package:my_theme_style/styles/icons.dart';
import 'package:my_theme_style/styles/insets.dart';
import 'package:my_theme_style/styles/shadows.dart';
import 'package:my_theme_style/styles/sizes.dart';
import 'package:my_theme_style/styles/styles.dart';
import 'package:my_theme_style/styles/texts.dart';
import 'package:my_theme_style/styles/times.dart';

import 'flutter_ui_base.dart';

AppLocalizations get $strings => FlutterUiBase.localizations;

AppStyle get $styles => FlutterUiBase.appStyle;

AppColors get $colors => FlutterUiBase.appStyle.colors;

AppGradients get $gradients => FlutterUiBase.appStyle.gradients;

Corners get $corners => FlutterUiBase.appStyle.corners;

Shadows get $shadows => FlutterUiBase.appStyle.shadows;

Insets get $insets => FlutterUiBase.appStyle.insets;

Texts get $textStyle => FlutterUiBase.appStyle.text;

Times get $durations => FlutterUiBase.appStyle.times;

Sizes get $sizes => FlutterUiBase.appStyle.sizes;

typedef $icons = AppIcons;
