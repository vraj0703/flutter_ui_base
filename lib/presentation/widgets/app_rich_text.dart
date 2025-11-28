import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  final String text;
  final TextStyle? defaultTextStyle;
  final Map<String, TextStyle>? tagStyles;
  final Map<String, void Function()>? tagActions;
  final Map<String, dynamic>? widgetTags;
  final TextOverflow overflow;

  const AppRichText(
      {super.key,
      required this.text,
      required this.defaultTextStyle,
      this.tagStyles,
      this.tagActions,
      this.widgetTags,
      this.overflow = TextOverflow.clip});

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: overflow,
      text: _parseText(text),
    );
  }

  TextSpan _parseText(String input) {
    final RegExp exp = RegExp(r'<(\w+)>(.*?)</\1>|([^<]+)');
    final List<InlineSpan> spans = [];

    for (final Match match in exp.allMatches(input)) {
      if (match[1] != null) {
        final String tag = match[1]!;
        final String content = match[2]!;
        if (widgetTags != null && widgetTags!.containsKey(tag)) {
          final inlineWidget = widgetTags![tag]!;
          if (inlineWidget is Widget) {
            final child = (tagActions != null && tagActions!.containsKey(tag))
                ? InkWell(
                    child: widgetTags![tag]!,
                    onTap: () {
                      tagActions![tag]!();
                    },
                  )
                : widgetTags![tag]!;
            spans.add(WidgetSpan(child: child));
          } else if (inlineWidget is WidgetSpan) {
            spans.add(inlineWidget);
          }
        } else {
          spans.add(TextSpan(
              text: content,
              style: tagStyles![tag] ?? defaultTextStyle,
              recognizer: (tagActions != null && tagActions!.containsKey(tag))
                  ? (TapGestureRecognizer()
                    ..onTap = () {
                      tagActions![tag]!();
                    })
                  : null));
        }
      } else if (match[3] != null) {
        spans.add(TextSpan(text: match[3], style: defaultTextStyle));
      }
    }

    return TextSpan(children: spans, style: defaultTextStyle);
  }
}
