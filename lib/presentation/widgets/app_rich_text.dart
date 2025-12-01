import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    required this.text,
    this.defaultTextStyle,
    this.tagStyles,
    this.tagActions,
    this.widgetTags,
    this.overflow = TextOverflow.clip,
  });

  final String text;
  final TextStyle? defaultTextStyle;
  final Map<String, TextStyle>? tagStyles;
  final Map<String, VoidCallback>? tagActions;
  final Map<String, dynamic>? widgetTags;
  final TextOverflow overflow;

  static final RegExp _tagPattern = RegExp(r'<(\w+)>(.*?)<\/\1>|([^<]+)');

  @override
  Widget build(BuildContext context) {
    return RichText(overflow: overflow, text: _parseText(text));
  }

  TextSpan _parseText(String input) {
    final List<InlineSpan> spans = [];

    for (final Match match in _tagPattern.allMatches(input)) {
      final String? tag = match[1];
      final String? content = match[2];
      final String? plainText = match[3];

      if (tag != null && content != null) {
        if (widgetTags?.containsKey(tag) ?? false) {
          final dynamic inlineWidget = widgetTags![tag];
          if (inlineWidget is Widget) {
            final Widget child = (tagActions?.containsKey(tag) ?? false)
                ? InkWell(onTap: tagActions![tag], child: inlineWidget)
                : inlineWidget;
            spans.add(WidgetSpan(child: child));
          } else if (inlineWidget is InlineSpan) {
            spans.add(inlineWidget);
          }
        } else {
          final TextStyle? style = tagStyles?[tag] ?? defaultTextStyle;
          final VoidCallback? action = tagActions?[tag];

          spans.add(
            TextSpan(
              text: content,
              style: style,
              recognizer: action != null
                  ? (TapGestureRecognizer()..onTap = action)
                  : null,
            ),
          );
        }
      } else if (plainText != null) {
        spans.add(TextSpan(text: plainText, style: defaultTextStyle));
      }
    }

    return TextSpan(children: spans, style: defaultTextStyle);
  }
}
