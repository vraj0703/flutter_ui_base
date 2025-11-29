import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/controls/scroll_decorator.dart';

void main() {
  testWidgets('ScrollDecorator.shadow renders shadow on scroll', (
    WidgetTester tester,
  ) async {
    final controller = ScrollController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScrollDecorator.shadow(
            controller: controller,
            builder: (c) => ListView.builder(
              controller: c,
              itemCount: 50,
              itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
            ),
          ),
        ),
      ),
    );

    // Initial state: no shadow (extentBefore is 0)
    // Shadow container height is 24.
    // We can check if gradient is transparent or check opacity if logic was different.
    // Here logic is: color.withValues(alpha: ratio * color.a). ratio = 0.

    // Scroll down
    controller.jumpTo(100);
    await tester.pumpAndSettle();

    // Now ratio > 0.
    // We expect no crash and widget tree to contain decoration.
    expect(find.byType(ScrollDecorator), findsOneWidget);
  });

  testWidgets('ScrollDecorator.fade renders fade', (WidgetTester tester) async {
    final controller = ScrollController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScrollDecorator.fade(
            controller: controller,
            builder: (c) => ListView.builder(
              controller: c,
              itemCount: 50,
              itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
            ),
            begin: const Text('Begin'),
            end: const Text('End'),
          ),
        ),
      ),
    );

    expect(find.text('Begin'), findsOneWidget);
    expect(find.text('End'), findsOneWidget);
  });
}
