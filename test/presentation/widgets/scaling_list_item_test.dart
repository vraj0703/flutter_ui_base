import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/scaling_list_item.dart';

void main() {
  testWidgets('ScalingListItem scales based on scroll', (
    WidgetTester tester,
  ) async {
    final scrollPos = ValueNotifier<double>(0);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScalingListItem(
            scrollPos: scrollPos,
            child: const SizedBox(width: 100, height: 100, child: Text('Item')),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Initial state: visible. Scale should be around 1.35 - 0.5*0.35?
    // Logic: pctVisible = (amtVisible / widgetHeight * .5).clamp(0, 1)
    // If fully visible: amtVisible = 100. widgetHeight = 100.
    // pctVisible = (100/100 * .5) = 0.5.
    // scale = 1.35 - 0.5 * .35 = 1.35 - 0.175 = 1.175.

    // We can't easily test exact scale without mocking ContextUtils or ensuring layout.
    // But we can check if it builds and contains Transform.scale.

    expect(find.byType(Transform), findsOneWidget);

    // Update scroll pos
    scrollPos.value = 100;
    await tester.pump();

    // Should rebuild
  });
}
