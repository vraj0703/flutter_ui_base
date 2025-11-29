import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/static_text_scale.dart';

void main() {
  testWidgets('StaticTextScale fixes text scale', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: StaticTextScale(scale: 1.5, child: Text('Scaled')),
      ),
    );

    final context = tester.element(find.text('Scaled'));
    final mediaQuery = MediaQuery.of(context);

    expect(mediaQuery.textScaler.scale(10), 15);
  });
}
