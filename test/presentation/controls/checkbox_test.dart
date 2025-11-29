import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/controls/checkbox.dart';
import 'package:flutter_ui_base/common_libs.dart';

void main() {
  testWidgets('SimpleCheckbox renders and toggles', (
    WidgetTester tester,
  ) async {
    bool? toggledValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SimpleCheckbox(
            active: false,
            label: 'Check me',
            onToggled: (value) => toggledValue = value,
          ),
        ),
      ),
    );

    expect(find.text('Check me'), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);

    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    expect(toggledValue, isTrue);
  });
}
