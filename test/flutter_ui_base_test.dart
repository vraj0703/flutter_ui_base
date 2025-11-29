import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/flutter_ui_base.dart';
import 'package:flutter_ui_base/flutter_ui_base_platform_interface.dart';
import 'package:flutter_ui_base/flutter_ui_base_method_channel.dart';
import 'package:my_localizations/l10n/app_localizations.dart';
import 'package:my_theme_style/styles/styles.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterUiBasePlatform
    with MockPlatformInterfaceMixin
    implements FlutterUiBasePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterUiBasePlatform initialPlatform = FlutterUiBasePlatform.instance;

  test('$MethodChannelFlutterUiBase is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterUiBase>());
  });

  test('getPlatformVersion', () async {
    FlutterUiBase flutterUiBasePlugin = FlutterUiBase();
    MockFlutterUiBasePlatform fakePlatform = MockFlutterUiBasePlatform();
    FlutterUiBasePlatform.instance = fakePlatform;

    expect(await flutterUiBasePlugin.getPlatformVersion(), '42');
  });

  test('initialize sets localizations and style', () async {
    final style = AppStyle();
    // Mocking AppLocalizations is tricky without the generated code,
    // so we'll try to load it or use a simple mock if possible.
    // For now, let's assume we can just pass a dummy if it's not strictly checked,
    // but the type signature requires AppLocalizations.
    // Let's try to use the delegate to load it.

    // Note: In a real unit test, we should probably mock AppLocalizations,
    // but since we don't have Mockito setup here yet, let's try to load it.
    // If this fails, we will need to create a MockAppLocalizations.

    // Actually, let's just create a class that extends AppLocalizations if possible,
    // or use a real one.

    // Since we can't easily see AppLocalizations source, let's try to load it.
    // This might fail if the test environment doesn't have the assets.

    // Alternative: Just check if we can instantiate it.
    // AppLocalizations usually has a lookup method.

    // Let's try to use a real instance via delegate if possible, or just skip strict check if we can't.
    // But we need to pass it to initialize.

    // Let's try to create a MockAppLocalizations.

    // We will try to run this and see if it compiles/runs.
    // If AppLocalizations is abstract, we can't instantiate it.

    // Let's assume for now we can't easily instantiate it without more info.
    // But wait, the user's code in main.dart did:
    // final localizations = await AppLocalizations.delegate.load(const Locale('en'));
    // We can try that.

    try {
      final localizations = await AppLocalizations.delegate.load(
        const Locale('en'),
      );

      await FlutterUiBase.initialize(
        style: style,
        localizations: localizations,
      );

      expect(FlutterUiBase.appStyle, equals(style));
      expect(FlutterUiBase.localizations, equals(localizations));
    } catch (e) {
      // If loading fails (e.g. no assets), we might need another approach.
      print('Failed to load localizations: $e');
      // For now, fail the test if we can't load.
      rethrow;
    }
  });
}
