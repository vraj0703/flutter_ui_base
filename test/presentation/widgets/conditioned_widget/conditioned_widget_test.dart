import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/conditioned_widget/conditioned_widget.dart';

void main() {
  testWidgets('ConditionedWidget shows correct child', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ConditionedWidget(
          conditioned: [
            Conditioned.widget(false, (_) => const Text('False 1')),
            Conditioned.widget(true, (_) => const Text('True 1')),
            Conditioned.widget(true, (_) => const Text('True 2')),
          ],
          defaultChild: (_) => const Text('Default'),
        ),
      ),
    );

    expect(find.text('True 1'), findsOneWidget);
    expect(find.text('False 1'), findsNothing);
    expect(find.text('True 2'), findsNothing);
    expect(find.text('Default'), findsNothing);
  });

  testWidgets('ConditionedWidget shows default child', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ConditionedWidget(
          conditioned: [
            Conditioned.widget(false, (_) => const Text('False 1')),
            Conditioned.widget(false, (_) => const Text('False 2')),
          ],
          defaultChild: (_) => const Text('Default'),
        ),
      ),
    );

    expect(find.text('Default'), findsOneWidget);
    expect(find.text('False 1'), findsNothing);
    expect(find.text('False 2'), findsNothing);
  });
}
