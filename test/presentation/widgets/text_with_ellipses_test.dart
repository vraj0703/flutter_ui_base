import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/text_with_ellipses.dart';

void main() {
  testWidgets('TextWithEllipses truncates text', (WidgetTester tester) async {
    const text =
        'This is a very long text that should be truncated because it exceeds the maximum number of lines allowed for this widget.';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 100,
            child: TextWithEllipses(
              text,
              maxLines: 1,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(RichText), findsOneWidget);

    // Verify that the text displayed is shorter than the original
    final richText = tester.widget<RichText>(find.byType(RichText));
    final plainText = richText.text.toPlainText();

    expect(plainText.length, lessThan(text.length));
    expect(plainText, endsWith('\u2026')); // Ends with ellipsis
  });
}
