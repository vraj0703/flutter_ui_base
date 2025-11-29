import 'package:flutter_ui_base/common_libs.dart';

import 'fullscreen_keyboard_listener.dart';

class FullscreenKeyboardListScroller extends StatefulWidget {
  const FullscreenKeyboardListScroller({
    super.key,
    required this.child,
    required this.scrollController,
  });

  final Widget child;
  final ScrollController scrollController;

  @override
  State<FullscreenKeyboardListScroller> createState() =>
      _FullscreenKeyboardListScrollerState();
}

class _FullscreenKeyboardListScrollerState
    extends State<FullscreenKeyboardListScroller> {
  static const int _scrollAmountOnPress = 75;
  static const int _scrollAmountOnHold = 30;
  static final Duration _keyPressAnimationDuration = $durations.short2 * .5;
  final Throttler _throttler = Throttler(32.milliseconds);

  double clampOffset(double px) =>
      px.clamp(0, widget.scrollController.position.maxScrollExtent).toDouble();

  void _handleKeyDown(int px) {
    widget.scrollController.animateTo(
      clampOffset(widget.scrollController.offset + px),
      duration: _keyPressAnimationDuration,
      curve: Curves.easeOut,
    );
  }

  void _handleKeyRepeat(int px) {
    final offset = clampOffset(widget.scrollController.offset + px);
    _throttler.call(() => widget.scrollController.jumpTo(offset));
  }

  @override
  Widget build(BuildContext context) {
    return FullscreenKeyboardListener(
      child: widget.child,
      onKeyRepeat: (event) {
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          _handleKeyRepeat(-_scrollAmountOnHold);
          return true;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          _handleKeyRepeat(_scrollAmountOnHold);
          return true;
        }
        return false;
      },
      onKeyDown: (event) {
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          _handleKeyDown(-_scrollAmountOnPress);
          return true;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          _handleKeyDown(_scrollAmountOnPress);
          return true;
        }
        if (event.logicalKey == LogicalKeyboardKey.pageUp) {
          _handleKeyDown(-_getViewportSize(context));
          return true;
        }
        if (event.logicalKey == LogicalKeyboardKey.pageDown) {
          _handleKeyDown(_getViewportSize(context));
          return true;
        }
        return false;
      },
    );
  }

  int _getViewportSize(BuildContext context) {
    final rb = context.findRenderObject() as RenderBox?;
    if (rb != null) {
      return rb.size.height.round() - 100;
    }
    return 0;
  }
}
