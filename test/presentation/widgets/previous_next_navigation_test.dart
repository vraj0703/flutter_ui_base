import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/previous_next_navigation.dart';
// Mock CircleIconBtn or assume it works.
// CircleIconBtn is likely a custom widget. If it's not exported, we might have issues.
// But common_libs exports it.

void main() {
  testWidgets('PreviousNextNavigation handles clicks', (
    WidgetTester tester,
  ) async {
    bool prev = false;
    bool next = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PreviousNextNavigation(
            onPreviousPressed: () => prev = true,
            onNextPressed: () => next = true,
            child: const SizedBox(width: 100, height: 100),
          ),
        ),
      ),
    );

    // Find buttons by semantic label
    await tester.tap(find.bySemanticsLabel('Previous'));
    expect(prev, isTrue);

    await tester.tap(find.bySemanticsLabel('Next'));
    expect(next, isTrue);
  });

  testWidgets('PreviousNextNavigation handles keyboard', (
    WidgetTester tester,
  ) async {
    bool prev = false;
    bool next = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PreviousNextNavigation(
            onPreviousPressed: () => prev = true,
            onNextPressed: () => next = true,
            child: const SizedBox(width: 100, height: 100),
          ),
        ),
      ),
    );

    await tester.pump(); // Focus

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    expect(prev, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    expect(next, isTrue);
  });
}
