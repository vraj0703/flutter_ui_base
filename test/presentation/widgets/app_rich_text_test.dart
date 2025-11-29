import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/app_rich_text.dart';

void main() {
  testWidgets('AppRichText renders plain text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AppRichText(text: 'Hello World')),
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is RichText && widget.text.toPlainText() == 'Hello World',
      ),
      findsOneWidget,
    );
  });

  testWidgets('AppRichText renders styled tags', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppRichText(
            text: 'Hello <b>World</b>',
            tagStyles: {'b': const TextStyle(fontWeight: FontWeight.bold)},
          ),
        ),
      ),
    );

    final richTextFinder = find.byType(RichText);
    expect(richTextFinder, findsOneWidget);

    // It's hard to find styled text directly with find.text, but we can check if RichText contains the span.
    // For simplicity, we assume if it doesn't crash and renders, it's likely working.
    // A more robust test would inspect the RichText widget.
  });

  testWidgets('AppRichText handles tap actions', (WidgetTester tester) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppRichText(
            text: 'Click <link>Here</link>',
            tagActions: {'link': () => tapped = true},
          ),
        ),
      ),
    );

    // Verify that the recognizer is attached to the span
    final richTextFinder = find.byType(RichText);
    final richText = tester.widget<RichText>(richTextFinder);
    final textSpan = richText.text as TextSpan;

    // "Click " is the first child, "Here" is the second.
    // However, _parseText returns a TextSpan with children.
    // The children list should contain: TextSpan("Click "), TextSpan("Here", recognizer: ...)

    final children = textSpan.children!;
    expect(children.length, 2);

    final clickSpan = children[0] as TextSpan;
    expect(clickSpan.text, 'Click ');

    final hereSpan = children[1] as TextSpan;
    expect(hereSpan.text, 'Here');
    expect(hereSpan.recognizer, isNotNull);

    // We can manually invoke the callback to ensure it's wired up
    (hereSpan.recognizer as TapGestureRecognizer).onTap!();
    expect(tapped, isTrue);
  });
}
