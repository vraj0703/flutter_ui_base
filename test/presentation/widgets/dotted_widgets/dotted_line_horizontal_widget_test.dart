import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/dotted_widgets/dotted_line_horizontal_widget.dart';

void main() {
  testWidgets('DottedLineHorizontalWidget renders', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DottedLineHorizontalWidget(
            dashWidth: 5,
            dashHeight: 2,
            dashSpacing: 3,
            color: Colors.red,
          ),
        ),
      ),
    );

    expect(find.byType(CustomPaint), findsOneWidget);
  });
}
