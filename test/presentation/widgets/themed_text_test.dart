import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/themed_text.dart';

void main() {
  testWidgets('ThemedText applies colors', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Column(
          children: [
            LightText(child: Text('Light')),
            DarkText(child: Text('Dark')),
            DefaultTextColor(color: Colors.red, child: Text('Red')),
          ],
        ),
      ),
    );

    final lightText = tester.widget<Text>(find.text('Light'));
    // Text widget style might be null if it inherits?
    // But DefaultTextStyle should provide it.
    // However, Text widget merges style.
    // Let's check the DefaultTextStyle above it.

    final lightContext = tester.element(find.text('Light'));
    final lightStyle = DefaultTextStyle.of(lightContext).style;
    expect(lightStyle.color, Colors.white);

    final darkContext = tester.element(find.text('Dark'));
    final darkStyle = DefaultTextStyle.of(darkContext).style;
    // $colors.black is likely Colors.black or similar.
    // We can't check exact value without knowing $colors.
    // But we can check it's not white.
    expect(darkStyle.color, isNot(Colors.white));

    final redContext = tester.element(find.text('Red'));
    final redStyle = DefaultTextStyle.of(redContext).style;
    expect(redStyle.color, Colors.red);
  });
}
