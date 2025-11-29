import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/fullscreen_keyboard_listener.dart';

void main() {
  testWidgets('FullscreenKeyboardListener handles key events', (
    WidgetTester tester,
  ) async {
    bool keyDown = false;
    bool keyUp = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FullscreenKeyboardListener(
            child: Container(),
            onKeyDown: (event) {
              if (event.logicalKey == LogicalKeyboardKey.space) {
                keyDown = true;
                return true;
              }
              return false;
            },
            onKeyUp: (event) {
              if (event.logicalKey == LogicalKeyboardKey.space) {
                keyUp = true;
                return true;
              }
              return false;
            },
          ),
        ),
      ),
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.space);
    await tester.pump();

    expect(keyDown, isTrue);
    expect(keyUp, isTrue);
  });
}
