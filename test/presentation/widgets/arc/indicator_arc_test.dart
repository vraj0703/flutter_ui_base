import 'package:flutter/material.dart';
import 'package:flutter_core/core/models/color_percentage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/arc/indicator_arc.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  testWidgets('IndicatorArc renders and animates', (WidgetTester tester) async {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: IndicatorArc(
            startAngle: 0,
            sweepAngle: 3.14,
            strokeWidth: 10,
            colorPercentages: [
              ColorPercentage(Colors.red, 0.5),
              ColorPercentage(Colors.blue, 0.5),
            ],
            width: 100,
            height: 100,
            animationDuration: const Duration(milliseconds: 100),
          ),
        ),
      ),
    );

    // Initial build
    expect(find.byType(CustomPaint), findsOneWidget);

    // Trigger animation
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    await tester.pumpAndSettle();
  });
}
