import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/controls/diagonal_text_page_indicator.dart';

void main() {
  testWidgets('DiagonalTextPageIndicator renders numbers', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: DiagonalTextPageIndicator(current: 1, total: 3)),
      ),
    );

    expect(find.text('01'), findsOneWidget);
    expect(find.text('03'), findsOneWidget);
    expect(
      find.byType(CustomPaint),
      findsWidgets,
    ); // Clippers use CustomPaint/ClipPath
  });
}
