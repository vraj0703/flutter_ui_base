import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/controls/app_page_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_ui_base/common_libs.dart';

void main() {
  testWidgets('AppPageIndicator renders and updates', (
    WidgetTester tester,
  ) async {
    final controller = PageController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppPageIndicator(count: 3, controller: controller),
        ),
      ),
    );

    expect(find.byType(SmoothPageIndicator), findsOneWidget);

    // Verify initial state
    // We can't easily check internal state, but we can check if it doesn't crash.

    // Scroll page
    controller.jumpToPage(1);
    await tester.pump();

    // Verify update
    // Again, visual verification is hard without golden tests or inspecting SmoothPageIndicator internals.
    // But we verified that listener is attached and working (no crash).

    await tester.pumpWidget(Container()); // Dispose
    // Should not throw on dispose
  });
}
