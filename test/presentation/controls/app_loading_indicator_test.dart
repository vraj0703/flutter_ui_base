import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/controls/app_loading_indicator.dart';

void main() {
  testWidgets('AppLoadingIndicator renders indeterminate', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: AppLoadingIndicator())),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    final indicator = tester.widget<CircularProgressIndicator>(
      find.byType(CircularProgressIndicator),
    );
    expect(indicator.value, isNull);
  });

  testWidgets('AppLoadingIndicator renders determinate', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: AppLoadingIndicator(value: 0.5))),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    final indicator = tester.widget<CircularProgressIndicator>(
      find.byType(CircularProgressIndicator),
    );
    expect(indicator.value, 0.5);
  });

  testWidgets('AppLoadingIndicator renders indeterminate for small values', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: AppLoadingIndicator(value: 0.04))),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    final indicator = tester.widget<CircularProgressIndicator>(
      find.byType(CircularProgressIndicator),
    );
    expect(indicator.value, isNull);
  });
}
