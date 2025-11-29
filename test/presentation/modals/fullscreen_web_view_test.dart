import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/modals/fullscreen_web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  testWidgets('FullscreenWebView renders WebViewWidget', (
    WidgetTester tester,
  ) async {
    // WebViewPlatform.instance must be set for testing if not using platform channel mocks.
    // However, webview_flutter 4.x uses PlatformInterface.
    // We can just check if it builds without crashing.

    await tester.pumpWidget(
      MaterialApp(home: FullscreenWebView('https://flutter.dev')),
    );

    expect(find.byType(FullscreenWebView), findsOneWidget);
    expect(find.byType(WebViewWidget), findsOneWidget);
  });
}
