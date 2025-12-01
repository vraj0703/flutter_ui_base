import 'package:flutter_ui_base/common_libs.dart';

class ArrowDir {
  const ArrowDir(this.hz, this.vt);

  final int hz;
  final int vt;

  bool get isNotZero => hz != 0 || vt != 0;
}

class KeyboardArrowsListener extends StatefulWidget {
  const KeyboardArrowsListener({
    super.key,
    required this.child,
    required this.onArrow,
  });

  final Widget child;
  final void Function(ArrowDir dir) onArrow;

  @override
  State<KeyboardArrowsListener> createState() => _KeyboardArrowsListenerState();
}

class _KeyboardArrowsListenerState extends State<KeyboardArrowsListener> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      focusNode: _focusNode,
      onKeyEvent: _handleKey,
      child: widget.child,
    );
  }

  KeyEventResult _handleKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    // KeyRepeatEvent is a subclass of KeyDownEvent in some versions or separate?
    // In recent Flutter, KeyRepeatEvent exists.
    // If we want to ignore repeats:
    if (event is KeyRepeatEvent) return KeyEventResult.ignored;

    int hz = 0;
    int vt = 0;

    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      hz = -1;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      hz = 1;
    }

    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      vt = 1;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      vt = -1;
    }

    final arrowDir = ArrowDir(hz, vt);
    if (arrowDir.isNotZero) {
      widget.onArrow(arrowDir);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
