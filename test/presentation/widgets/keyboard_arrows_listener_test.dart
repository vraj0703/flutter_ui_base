import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/keyboard_arrows_listener.dart';

void main() {
  testWidgets('KeyboardArrowsListener detects arrow keys', (
    WidgetTester tester,
  ) async {
    ArrowDir? lastDir;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: KeyboardArrowsListener(
            onArrow: (dir) => lastDir = dir,
            child: const SizedBox(width: 100, height: 100),
          ),
        ),
      ),
    );

    await tester.pump(); // Ensure focus

    // Press Arrow Right
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    expect(lastDir, isNotNull);
    expect(lastDir!.hz, 1);
    expect(lastDir!.vt, 0);

    // Press Arrow Up
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    expect(lastDir!.hz, 0);
    expect(lastDir!.vt, 1);
  });
}
