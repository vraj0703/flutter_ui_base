import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/controls/circle_buttons.dart';
import 'package:flutter_ui_base/common_libs.dart';

void main() {
  testWidgets('CircleBtn renders and handles tap', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CircleBtn(
            semanticLabel: 'Circle Button',
            onPressed: () => pressed = true,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );

    expect(find.byType(CircleBtn), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(find.byType(CircleBtn));
    await tester.pump();

    expect(pressed, isTrue);
  });

  testWidgets('BackBtn pops navigator', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const Scaffold(body: BackBtn()),
                ),
              ),
              child: const Text('Push'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Push'));
    await tester.pumpAndSettle();

    expect(find.byType(BackBtn), findsOneWidget);

    await tester.tap(find.byType(BackBtn));
    await tester.pumpAndSettle();

    expect(find.byType(BackBtn), findsNothing);
    expect(find.text('Push'), findsOneWidget);
  });
}
