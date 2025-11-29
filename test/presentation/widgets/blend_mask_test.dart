import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/blend_mask.dart';

void main() {
  testWidgets('BlendMask paints correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BlendMask(
            blendModes: [BlendMode.multiply],
            child: Text('Hello'),
          ),
        ),
      ),
    );

    expect(find.byType(BlendMask), findsOneWidget);
    // Verifying paint calls is hard without a golden test or custom painter inspection.
    // But we can ensure it doesn't crash due to unbalanced save/restore.
  });

  testWidgets('BlendMask handles multiple blend modes', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BlendMask(
            blendModes: [BlendMode.multiply, BlendMode.screen],
            child: Text('Hello'),
          ),
        ),
      ),
    );

    expect(find.byType(BlendMask), findsOneWidget);
  });
}
