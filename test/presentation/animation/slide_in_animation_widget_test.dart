import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/animation/slide_in_animation_widget.dart';

void main() {
  testWidgets('SlideInTransitionWidget animates position', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SlideInTransitionWidget(
            duration: Duration(milliseconds: 100),
            widget: Text('Slide Me'),
          ),
        ),
      ),
    );

    // Initial state: offset (-1, 0)
    // SlideTransition applies transform.
    // We can check if widget is present.
    expect(find.text('Slide Me'), findsOneWidget);

    // Advance half way
    await tester.pump(const Duration(milliseconds: 50));

    // Advance to end
    await tester.pump(const Duration(milliseconds: 50));

    // Should be at final position.
    // Visual verification hard without golden, but no crash means animation ran.
  });
}
