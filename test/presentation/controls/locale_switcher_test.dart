import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/controls/locale_switcher.dart';
import 'package:flutter_ui_base/common_libs.dart';

void main() {
  testWidgets('LocaleSwitcher renders button', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: LocaleSwitcher())),
    );

    expect(find.byType(AppBtn), findsOneWidget);
  });
}
