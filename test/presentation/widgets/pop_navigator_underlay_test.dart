import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/pop_navigator_underlay.dart';
// Mock AppBtn if necessary, or rely on it being present.
// Since we are testing integration with AppBtn, we assume it works.
// However, AppBtn might need dependencies.
// Let's assume AppBtn is a simple widget for now.

void main() {
  testWidgets('PopNavigatorUnderlay pops navigator on tap', (
    WidgetTester tester,
  ) async {
    bool popped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                      PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (_, __, ___) => PopNavigatorUnderlay(),
                      ),
                    )
                    .then((_) => popped = true);
              },
              child: const Text('Push'),
            ),
          ),
        ),
      ),
    );

    // Push the route
    await tester.tap(find.text('Push'));
    await tester.pumpAndSettle();

    expect(find.byType(PopNavigatorUnderlay), findsOneWidget);

    // Tap the underlay
    // AppBtn usually responds to tap.
    await tester.tap(find.byType(PopNavigatorUnderlay));
    await tester.pumpAndSettle();

    expect(popped, isTrue);
    expect(find.byType(PopNavigatorUnderlay), findsNothing);
  });
}
