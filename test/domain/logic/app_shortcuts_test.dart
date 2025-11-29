import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/domain/logic/app_shortcuts.dart';

void main() {
  test('AppShortcuts defaults returns correct map', () {
    // Default test platform is android (usually).
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    expect(AppShortcuts.defaults, isNull);

    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    expect(AppShortcuts.defaults, isNull);

    debugDefaultTargetPlatformOverride = TargetPlatform.windows;
    expect(AppShortcuts.defaults, isNotNull);
    expect(AppShortcuts.defaults, isNotEmpty);

    debugDefaultTargetPlatformOverride = null;
  });
}
