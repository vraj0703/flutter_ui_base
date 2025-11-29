import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/centered_box.dart';

void main() {
  testWidgets('CenteredBox renders child', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: CenteredBox(child: Text('Hello'))),
      ),
    );

    expect(find.text('Hello'), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
  });

  testWidgets('CenteredBox applies padding and size', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CenteredBox(
            width: 100,
            height: 100,
            padding: EdgeInsets.all(10),
            child: Text('Hello'),
          ),
        ),
      ),
    );

    final paddingFinder = find.byType(Padding);
    final padding = tester.widget<Padding>(paddingFinder);
    expect(padding.padding, const EdgeInsets.all(10));

    final sizedBoxFinder = find.byType(SizedBox);
    final sizedBox = tester.widget<SizedBox>(sizedBoxFinder);
    expect(sizedBox.width, 100);
    expect(sizedBox.height, 100);
  });
}
