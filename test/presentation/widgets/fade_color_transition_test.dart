import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/fade_color_transition.dart';

void main() {
  testWidgets('FadeColorTransition renders correctly', (
    WidgetTester tester,
  ) async {
    final controller = AnimationController(
      vsync: const TestVSync(),
      duration: const Duration(seconds: 1),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FadeColorTransition(animation: controller, color: Colors.red),
        ),
      ),
    );

    expect(find.byType(FadeColorTransition), findsOneWidget);
    expect(find.byType(ColoredBox), findsOneWidget);

    // Check initial color (alpha 0)
    final coloredBox = tester.widget<ColoredBox>(find.byType(ColoredBox));
    expect(coloredBox.color.a, 0);

    // Animate
    controller.forward();
    await tester.pumpAndSettle();

    // Check final color (alpha 1)
    final coloredBoxAfter = tester.widget<ColoredBox>(find.byType(ColoredBox));
    expect(coloredBoxAfter.color.a, 255); // 1.0 * 255
  });
}
