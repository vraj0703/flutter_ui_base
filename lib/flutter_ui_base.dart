import 'flutter_ui_base_platform_interface.dart';
import 'package:my_localizations/library.dart';
import 'package:my_theme_style/styles/styles.dart' show AppStyle;

/// A Flutter plugin that initializes with AppLocalizations and AppStyle.
///
/// This class provides a centralized point for accessing localization strings
/// and application styles. It utilizes GetIt for dependency injection.
class FlutterUiBase {
  static late AppLocalizations _localizations;
  static late AppStyle _appStyle;

  /// Initializes the FlutterBase plugin.
  ///
  /// This method should be called once during app startup, typically in `main.dart`.
  /// It registers [AppLocalizations] and [AppStyle] with GetIt for global access.
  static Future<void> initialize({
    required AppStyle style,
    required AppLocalizations localizations,
  }) async {
    _localizations = localizations;
    _appStyle = style;
  }

  Future<String?> getPlatformVersion() {
    return FlutterUiBasePlatform.instance.getPlatformVersion();
  }

  static AppLocalizations get localizations => _localizations;

  static AppStyle get appStyle => _appStyle;
}

/// Global helpers for readability
AppLocalizations get $strings => FlutterUiBase.localizations;

AppStyle get $styles => FlutterUiBase.appStyle;
