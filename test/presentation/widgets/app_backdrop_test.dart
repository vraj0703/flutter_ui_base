import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/app_backdrop.dart';
import 'package:flutter_ui_base/common_libs.dart';

void main() {
  testWidgets('AppBackdrop renders correctly without blur', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: AppBackdrop(strength: 0.5))),
    );

    final containerFinder = find.byType(Container);
    // We expect at least one container (the fill)
    expect(containerFinder, findsWidgets);
  });

  testWidgets('AppBackdrop renders correctly with blur', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AppBackdrop(strength: 0.5, blur: true)),
      ),
    );

    expect(find.byType(BackdropFilter), findsOneWidget);
  });

  testWidgets('AppBackdrop renders child', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AppBackdrop(child: Text('Hello'))),
      ),
    );

    expect(find.text('Hello'), findsOneWidget);
  });
}
