import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/list_gradient.dart';
import 'package:flutter_ui_base/presentation/widgets/gradient_container.dart';

void main() {
  testWidgets('ListOverscrollGradient renders VtGradient', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ListOverscrollGradient(
            size: 50,
            color: Colors.red,
            bottomUp: false,
          ),
        ),
      ),
    );

    expect(find.byType(ListOverscrollGradient), findsOneWidget);
    expect(find.byType(VtGradient), findsOneWidget);

    final gradient = tester.widget<VtGradient>(find.byType(VtGradient));
    expect(gradient.height, 50);
    expect(gradient.colors.first.a, 255); // Opaque
    expect(gradient.colors.last.a, 0); // Transparent
  });

  testWidgets('ListOverscrollGradient renders bottomUp', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ListOverscrollGradient(
            size: 50,
            color: Colors.red,
            bottomUp: true,
          ),
        ),
      ),
    );

    final gradient = tester.widget<VtGradient>(find.byType(VtGradient));
    expect(gradient.colors.first.a, 0); // Transparent
    expect(gradient.colors.last.a, 255); // Opaque
  });
}
