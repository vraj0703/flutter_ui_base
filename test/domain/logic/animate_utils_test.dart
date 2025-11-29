import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/domain/logic/animate_utils.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  testWidgets('maybeAnimate returns Animate widget', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: Container().maybeAnimate())),
    );

    expect(find.byType(Animate), findsOneWidget);
  });
}
