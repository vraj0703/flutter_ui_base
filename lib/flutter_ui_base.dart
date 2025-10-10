import 'package:injectable/injectable.dart';

import 'flutter_ui_base_platform_interface.dart';
import 'package:get_it/get_it.dart';
import 'package:my_localizations/library.dart';
import 'package:my_theme_style/styles/styles.dart' show AppStyle;

@InjectableInit()
Future<void> configureDependencies(String flavor) async =>
    GetIt.instance;

/// A Flutter plugin that initializes with AppLocalizations and AppStyle.
///
/// This class provides a centralized point for accessing localization strings
/// and application styles. It utilizes GetIt for dependency injection.
class FlutterUiBase {
  /// Initializes the FlutterBase plugin.
  ///
  /// This method should be called once during app startup, typically in `main.dart`.
  /// It registers [AppLocalizations] and [AppStyle] with GetIt for global access.
  static Future<void> initialize({
    required AppStyle style,
    required AppLocalizations localizations,
  }) async {
    GetIt.I.registerSingleton<AppStyle>(style);
    GetIt.I.registerSingleton<AppLocalizations>(localizations);
  }

  Future<String?> getPlatformVersion() {
    return FlutterUiBasePlatform.instance.getPlatformVersion();
  }
}

/// Global helpers for readability
AppLocalizations get $strings => GetIt.I.get<AppLocalizations>();

AppStyle get $styles => GetIt.I.get<AppStyle>();
