import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/controls/buttons.dart';
import 'package:flutter_ui_base/common_libs.dart';

void main() {
  testWidgets('AppBtn renders text and handles tap', (
    WidgetTester tester,
  ) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppBtn.from(text: 'Click Me', onPressed: () => pressed = true),
        ),
      ),
    );

    expect(find.text('CLICK ME'), findsOneWidget); // Uppercase

    await tester.tap(find.byType(AppBtn));
    await tester.pumpAndSettle();

    expect(pressed, isTrue);
  });

  testWidgets('AppBtn handles focus node lifecycle', (
    WidgetTester tester,
  ) async {
    // Test internal focus node creation and disposal (implicit check via no leaks/errors)
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppBtn.from(text: 'Focus Me', onPressed: () {}),
        ),
      ),
    );

    await tester.pumpWidget(Container()); // Dispose
  });
}
