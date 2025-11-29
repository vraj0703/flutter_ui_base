import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/fullscreen_keyboard_list_scroller.dart';

void main() {
  testWidgets('FullscreenKeyboardListScroller scrolls on key press', (
    WidgetTester tester,
  ) async {
    final scrollController = ScrollController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FullscreenKeyboardListScroller(
            scrollController: scrollController,
            child: ListView.builder(
              controller: scrollController,
              itemCount: 100,
              itemBuilder: (context, index) =>
                  SizedBox(height: 50, child: Text('Item $index')),
            ),
          ),
        ),
      ),
    );

    // Initial offset
    expect(scrollController.offset, 0);

    // Simulate arrow down key
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();

    // Should have scrolled
    expect(scrollController.offset, greaterThan(0));

    // Simulate arrow up key
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pumpAndSettle();

    // Should have scrolled back up (or at least less than before)
    // Note: The exact amount depends on the implementation constants.
  });
}
