import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/snackbar/snack_bar_alert.dart';

void main() {
  testWidgets('AppSnackBarAlert creates SnackBar with content', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    AppSnackBarAlert.makeSnackBarToastWidget(
                      context,
                      title: 'Title',
                      message: 'Message',
                    ),
                  );
                },
                child: const Text('Show'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show'));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Message'), findsOneWidget);
  });
}
