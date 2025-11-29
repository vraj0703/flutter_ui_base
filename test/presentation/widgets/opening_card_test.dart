import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/opening_card.dart';

void main() {
  testWidgets('OpeningCard animates size change', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OpeningCard(
            isOpen: false,
            closedBuilder: (_) => SizedBox(width: 50, height: 50),
            openBuilder: (_) => SizedBox(width: 100, height: 100),
          ),
        ),
      ),
    );

    // Initial state: closed
    await tester.pump(); // Microtask for MeasurableWidget
    await tester.pumpAndSettle(); // Animation

    // Should be 50x50
    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
    // Note: OpeningCard wraps content in SizedBox with animated size.
    // But there are multiple SizedBoxes (one in builder, one in OpeningCard).
    // The one in OpeningCard has the animated size.
    // Let's find the one that is child of Padding.
    final padding = tester.widget<Padding>(find.byType(Padding));
    final animatedSizedBox = padding.child as SizedBox;
    expect(animatedSizedBox.width, 50);
    expect(animatedSizedBox.height, 50);

    // Open
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OpeningCard(
            isOpen: true,
            closedBuilder: (_) => SizedBox(width: 50, height: 50),
            openBuilder: (_) => SizedBox(width: 100, height: 100),
          ),
        ),
      ),
    );

    await tester.pump(); // Microtask
    await tester.pump(); // Start animation

    // Should be animating towards 100
    final paddingAnimating = tester.widget<Padding>(find.byType(Padding));
    final animatedSizedBoxAnimating = paddingAnimating.child as SizedBox;
    expect(animatedSizedBoxAnimating.width, greaterThan(50));

    await tester.pumpAndSettle();

    // Should be 100x100
    final paddingOpen = tester.widget<Padding>(find.byType(Padding));
    final animatedSizedBoxOpen = paddingOpen.child as SizedBox;
    expect(animatedSizedBoxOpen.width, 100);
    expect(animatedSizedBoxOpen.height, 100);
  });
}
