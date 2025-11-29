import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/gradient_container.dart';

void main() {
  testWidgets('GradientContainer renders correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GradientContainer(
            [Colors.red, Colors.blue],
            [0.0, 1.0],
            child: Text('Hello'),
          ),
        ),
      ),
    );

    expect(find.text('Hello'), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);

    // Verify gradient is applied (via BoxDecoration)
    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.gradient, isA<LinearGradient>());
  });

  testWidgets('GradientContainer handles clicks by default', (
    WidgetTester tester,
  ) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GradientContainer(
            const [Colors.red, Colors.blue],
            const [0.0, 1.0],
            child: GestureDetector(
              onTap: () => tapped = true,
              child: const Text('Tap Me'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Tap Me'));
    expect(tapped, isTrue);
  });

  testWidgets('GradientContainer ignores clicks when ignorePointer is true', (
    WidgetTester tester,
  ) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GradientContainer(
            const [Colors.red, Colors.blue],
            const [0.0, 1.0],
            ignorePointer: true,
            child: GestureDetector(
              onTap: () => tapped = true,
              child: const Text('Tap Me'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Tap Me'));
    expect(tapped, isFalse);
  });
}
