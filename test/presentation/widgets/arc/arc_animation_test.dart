import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/arc/arc_animation.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  testWidgets('AnimatedGradientArc starts animation when visible', (
    WidgetTester tester,
  ) async {
    // VisibilityDetector needs to be mocked or we need to simulate visibility.
    // In tests, VisibilityDetector usually reports visible immediately if on screen.
    // But we need to ensure it's pumped.

    VisibilityDetectorController.instance.updateInterval = Duration.zero;

    bool built = false;
    double lastAnimValue = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnimatedGradientArc(
            duration: const Duration(milliseconds: 100),
            builder: (context, animValue) {
              built = true;
              lastAnimValue = animValue;
              return CustomPainterMock();
            },
          ),
        ),
      ),
    );

    // Initial build
    expect(built, isTrue);
    expect(lastAnimValue, 0);

    // Trigger visibility
    // VisibilityDetector in tests might need help.
    // But usually pumpWidget does layout and VisibilityDetector checks it.

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    // Should be animating
    expect(lastAnimValue, greaterThan(0));

    await tester.pumpAndSettle();
    expect(lastAnimValue, 1.0);
  });
}

class CustomPainterMock extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
