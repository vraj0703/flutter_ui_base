import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/measurable_widget.dart';

void main() {
  testWidgets('MeasurableWidget reports size changes', (
    WidgetTester tester,
  ) async {
    Size? reportedSize;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: MeasurableWidget(
              onChange: (size) => reportedSize = size,
              child: const SizedBox(width: 100, height: 100),
            ),
          ),
        ),
      ),
    );

    // Wait for microtask
    await tester.pump();

    expect(reportedSize, const Size(100, 100));

    // Change size
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: MeasurableWidget(
              onChange: (size) => reportedSize = size,
              child: const SizedBox(width: 200, height: 50),
            ),
          ),
        ),
      ),
    );

    await tester.pump();

    expect(reportedSize, const Size(200, 50));
  });
}
