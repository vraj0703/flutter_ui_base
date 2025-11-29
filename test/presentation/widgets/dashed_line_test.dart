import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/dashed_line.dart';

void main() {
  testWidgets('DashedLine renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DashedLine(color: Colors.red, dashSize: 5, gapSize: 5),
        ),
      ),
    );

    expect(find.byType(DashedLine), findsOneWidget);
    expect(find.byType(CustomPaint), findsOneWidget);
  });

  testWidgets('DashedLine renders vertical', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: DashedLine(vertical: true))),
    );

    expect(find.byType(DashedLine), findsOneWidget);
    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
    expect(sizedBox.width, 2);
    expect(sizedBox.height, double.infinity);
  });
}
