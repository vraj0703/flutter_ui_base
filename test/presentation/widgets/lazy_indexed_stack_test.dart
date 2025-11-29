import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/lazy_indexed_stack.dart';

void main() {
  testWidgets('LazyIndexedStack builds children lazily', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LazyIndexedStack(
            index: 0,
            children: [Text('Child 0'), Text('Child 1')],
          ),
        ),
      ),
    );

    // Child 0 should be built
    expect(find.text('Child 0'), findsOneWidget);
    // Child 1 should NOT be built yet
    expect(find.text('Child 1'), findsNothing);

    // Switch to index 1
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LazyIndexedStack(
            index: 1,
            children: [Text('Child 0'), Text('Child 1')],
          ),
        ),
      ),
    );

    // Child 1 should now be built
    expect(find.text('Child 1'), findsOneWidget);
    // Child 0 should still be built (it was activated before)
    expect(find.text('Child 0'), findsOneWidget);
  });
}
