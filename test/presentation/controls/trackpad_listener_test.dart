import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/controls/trackpad_listener.dart';

void main() {
  testWidgets('TrackpadListener detects scroll', (WidgetTester tester) async {
    Offset? scrollDir;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TrackpadListener(
            scrollSensitivity: 10,
            onScroll: (dir) => scrollDir = dir,
            child: Container(width: 100, height: 100, color: Colors.red),
          ),
        ),
      ),
    );

    // Simulate trackpad scroll
    final center = tester.getCenter(find.byType(TrackpadListener));
    final event = PointerScrollEvent(
      position: center,
      kind: PointerDeviceKind.trackpad,
      scrollDelta: const Offset(0, 20), // Scroll down
    );

    await tester.sendEventToBinding(event);
    await tester.pump();

    // Logic: dy >= sensitivity (20 >= 10) -> direction (0, -1)
    expect(scrollDir, const Offset(0, -1));
  });
}
