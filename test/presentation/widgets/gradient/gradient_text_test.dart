import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/gradient/gradient_text.dart';

void main() {
  testWidgets('GradientText renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GradientText(
            'Hello World',
            gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
          ),
        ),
      ),
    );

    expect(find.byType(ShaderMask), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);
  });
}
