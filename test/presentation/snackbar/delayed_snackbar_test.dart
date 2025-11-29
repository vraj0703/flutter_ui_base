import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/snackbar/delayed_snackbar.dart';
import 'package:flutter_ui_base/presentation/snackbar/snackbar.dart';

void main() {
  testWidgets('showDelayedSnackbar shows snackbar after delay', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () {
                showDelayedSnackbar(
                  context: context,
                  message: 'Delayed Message',
                  delayedInMs: 100,
                );
              },
              child: const Text('Show'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show'));
    await tester.pump(); // Start delay

    expect(find.text('Delayed Message'), findsNothing);

    await tester.pump(const Duration(milliseconds: 100)); // Wait for delay
    await tester.pump(); // Show snackbar

    expect(find.text('Delayed Message'), findsOneWidget);
  });
}
