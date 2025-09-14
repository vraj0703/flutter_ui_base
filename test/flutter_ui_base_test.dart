import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/flutter_ui_base.dart';
import 'package:flutter_ui_base/flutter_ui_base_platform_interface.dart';
import 'package:flutter_ui_base/flutter_ui_base_method_channel.dart';
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
}
