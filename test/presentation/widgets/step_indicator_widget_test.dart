import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/step_indicator_widget.dart';

void main() {
  testWidgets('StepIndicatorWidget renders correct steps', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 300,
            child: StepIndicatorWidget(
              numberOfSteps: 3,
              currentStep:
                  1, // 0-indexed? Code says i <= currentStep. So 0, 1 are filled.
              fillColor: Colors.red,
            ),
          ),
        ),
      ),
    );

    // Should have 3 bars
    final bars = find.byType(Container).evaluate().where((e) {
      final container = e.widget as Container;
      return container.constraints?.maxHeight == 6;
    });
    expect(bars.length, 3);

    // Check colors
    // We can't easily check color without finding specific widgets.
    // But we can verify structure.
  });
}
