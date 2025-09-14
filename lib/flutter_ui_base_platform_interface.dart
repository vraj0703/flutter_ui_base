import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_ui_base_method_channel.dart';

abstract class FlutterUiBasePlatform extends PlatformInterface {
  /// Constructs a FlutterUiBasePlatform.
  FlutterUiBasePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterUiBasePlatform _instance = MethodChannelFlutterUiBase();

  /// The default instance of [FlutterUiBasePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterUiBase].
  static FlutterUiBasePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterUiBasePlatform] when
  /// they register themselves.
  static set instance(FlutterUiBasePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
