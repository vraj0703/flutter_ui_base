import 'package:flutter/material.dart';

/// A custom widget that displays text with ellipses if it exceeds the specified number of lines.
///
/// This widget ensures that ellipses are shown correctly even when the text contains newline characters.
/// It uses a [TextPainter] to measure the text and determine the appropriate truncation point.
class TextWithEllipses extends StatelessWidget {
  /// Creates a [TextWithEllipses] widget.
  ///
  /// The [data] parameter is the text to display.
  /// The [maxLines] parameter specifies the maximum number of lines before truncating.
  /// The [style] parameter specifies the text style to use.
  /// The [textAlign] parameter specifies how the text should be aligned horizontally.
  const TextWithEllipses(
    this.data, {
    super.key,
    required this.maxLines,
    required this.style,
    this.textAlign,
  });

  /// The text to display.
  final String data;

  /// The maximum number of lines before truncating.
  final int maxLines;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The text style to use.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);

        // Ellipsis character
        const String ellipsisChar = '\u2026';

        // Create a TextSpan with the data
        final text = TextSpan(
          style: style,
          text: data,
        );

        // Layout and measure the text
        TextPainter textPainter = TextPainter(
          text: text,
          textDirection: Directionality.of(context),
          textAlign: textAlign ?? TextAlign.start,
          maxLines: maxLines,
          ellipsis: ellipsisChar,
        );
        textPainter.layout(
            minWidth: constraints.minWidth, maxWidth: constraints.maxWidth);

        // Determine the end index of the truncated text
        int? endIndex;
        if (textPainter.didExceedMaxLines) {
          final position = textPainter.getPositionForOffset(Offset(
            textPainter.size.width,
            textPainter.size.height,
          ));
          endIndex = position.offset;
        }

        // Create a truncated TextSpan with ellipses
        TextSpan textSpan = TextSpan(
          style: style,
          text: endIndex == null
              ? data
              : data.substring(0, endIndex) + ellipsisChar,
        );

        return RichText(
          overflow: TextOverflow.ellipsis,
          text: textSpan,
          maxLines: maxLines,
        );
      },
    );
  }
}
