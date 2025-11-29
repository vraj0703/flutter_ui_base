import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/snackbar/snackbar.dart';

void main() {
  testWidgets('AppSnackBar shows snackbar', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () {
                AppSnackBar.show(
                  context,
                  message: 'Test Message',
                  style: const TextStyle(color: Colors.white),
                );
              },
              child: const Text('Show'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show'));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Test Message'), findsOneWidget);
  });
}
