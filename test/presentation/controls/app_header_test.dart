import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/controls/app_header.dart';
import 'package:flutter_ui_base/common_libs.dart';

void main() {
  testWidgets('AppHeader renders title and back button', (
    WidgetTester tester,
  ) async {
    // Assuming $styles and others are available or mocked.
    // If they are global singletons, they might need initialization.
    // For now, we try to pump and see.

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AppHeader(title: 'Test Title', showBackBtn: true)),
      ),
    );

    expect(find.text('TEST TITLE'), findsOneWidget); // UpperCase in code
    expect(find.byType(BackBtn), findsOneWidget);
  });

  testWidgets('AppHeader renders subtitle and trailing', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppHeader(
            title: 'Title',
            subtitle: 'Subtitle',
            showBackBtn: false,
            trailing: (context) => const Icon(Icons.settings),
          ),
        ),
      ),
    );

    expect(find.text('TITLE'), findsOneWidget);
    expect(find.text('SUBTITLE'), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
    expect(find.byType(BackBtn), findsNothing);
  });
}
