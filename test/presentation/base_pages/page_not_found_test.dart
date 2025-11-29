import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/base_pages/page_not_found.dart';
import 'package:flutter_ui_base/common_libs.dart';

void main() {
  testWidgets('PageNotFound renders message and button', (
    WidgetTester tester,
  ) async {
    bool homePressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: PageNotFound(
          'test/url',
          onHomePressed: () => homePressed = true,
          logoPath: 'assets/logo.png',
        ),
      ),
    );

    expect(find.text('Wonderous'), findsOneWidget);
    expect(find.text('BACK'), findsOneWidget); // AppBtn uppercases text

    await tester.tap(find.text('BACK'));
    await tester.pump();

    expect(homePressed, isTrue);
  });
}
