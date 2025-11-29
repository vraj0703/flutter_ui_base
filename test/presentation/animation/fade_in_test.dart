import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/animation/fade_in.dart';

void main() {
  testWidgets('FadeInWidget animates opacity', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FadeInWidget(
            duration: Duration(milliseconds: 100),
            child: Text('Fade Me'),
          ),
        ),
      ),
    );

    // Initial state: opacity 0
    expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, 0.0);

    // Advance half way
    await tester.pump(const Duration(milliseconds: 50));
    expect(
      tester.widget<Opacity>(find.byType(Opacity)).opacity,
      greaterThan(0.0),
    );
    expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, lessThan(1.0));

    // Advance to end
    await tester.pump(const Duration(milliseconds: 50));
    expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, 1.0);
  });
}
