import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/controls/eight_way_swipe_detector.dart';

void main() {
  testWidgets('EightWaySwipeDetector detects swipe', (
    WidgetTester tester,
  ) async {
    Offset? swipeDir;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EightWaySwipeDetector(
            threshold: 10,
            onSwipe: (dir) => swipeDir = dir,
            child: Container(width: 100, height: 100, color: Colors.red),
          ),
        ),
      ),
    );

    // Swipe right
    await tester.drag(find.byType(EightWaySwipeDetector), const Offset(50, 0));
    await tester.pump();

    expect(swipeDir, const Offset(1, 0));

    // Swipe down
    await tester.drag(find.byType(EightWaySwipeDetector), const Offset(0, 50));
    await tester.pump();

    expect(swipeDir, const Offset(0, 1));
  });
}
