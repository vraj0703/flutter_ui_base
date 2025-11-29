import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/dotted_widgets/dotted_line_vertical_widget.dart';

void main() {
  testWidgets('DottedLineVerticalWidget renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DottedLineVerticalWidget(
            dashWidth: 2,
            dashHeight: 5,
            dashSpacing: 3,
            color: Colors.blue,
          ),
        ),
      ),
    );

    expect(find.byType(CustomPaint), findsOneWidget);
  });
}
