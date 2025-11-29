import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/arc/gradient_arc.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  testWidgets('GradientArc renders and animates', (WidgetTester tester) async {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GradientArc(
            startAngle: 0,
            sweepAngle: 3.14,
            strokeWidth: 10,
            colors: [Colors.red, Colors.blue],
            colorStops: [0, 1],
            width: 100,
            height: 100,
            animationDuration: Duration(milliseconds: 100),
          ),
        ),
      ),
    );

    // Initial build
    expect(find.byType(CustomPaint), findsOneWidget);

    // Trigger animation
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    // We can't easily inspect the painted content, but we can verify no errors.

    await tester.pumpAndSettle();
  });
}
