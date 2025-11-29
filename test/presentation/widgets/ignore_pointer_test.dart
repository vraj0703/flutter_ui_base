import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/ignore_pointer.dart';

void main() {
  testWidgets('IgnorePointerKeepSemantics ignores clicks but keeps semantics', (
    WidgetTester tester,
  ) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              GestureDetector(
                onTap: () => tapped = true,
                behavior: HitTestBehavior.opaque,
                child: const SizedBox(width: 100, height: 100),
              ),
              IgnorePointerKeepSemantics(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red.withOpacity(0.5),
                  child: const Text('Ignored'),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Tap on the red box (which is on top)
    await tester.tap(find.text('Ignored'));

    // Should pass through to the GestureDetector below
    expect(tapped, isTrue);

    // Semantics should still be present
    expect(find.bySemanticsLabel('Ignored'), findsOneWidget);
  });

  testWidgets('IgnorePointerAndSemantics ignores clicks and semantics', (
    WidgetTester tester,
  ) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              GestureDetector(
                onTap: () => tapped = true,
                behavior: HitTestBehavior.opaque,
                child: const SizedBox(width: 100, height: 100),
              ),
              IgnorePointerAndSemantics(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red.withOpacity(0.5),
                  child: const Text('Fully Ignored'),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Tap on the red box
    await tester.tap(find.byType(IgnorePointerAndSemantics));

    // Should pass through
    expect(tapped, isTrue);

    // Semantics should be excluded
    // find.text finds widgets, not semantics.
    // find.bySemanticsLabel checks the semantic tree.
    expect(find.bySemanticsLabel('Fully Ignored'), findsNothing);
  });
}
