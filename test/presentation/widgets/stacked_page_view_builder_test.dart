import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/stacked_page_view_builder.dart';

void main() {
  testWidgets('StackedPageViewBuilder syncs controllers', (
    WidgetTester tester,
  ) async {
    PageController? capturedController;
    PageController? capturedFollower;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StackedPageViewBuilder(
            pageCount: 3,
            builder: (context, controller, follower) {
              capturedController = controller;
              capturedFollower = follower;
              return PageView.builder(
                controller: follower,
                itemCount: 3,
                itemBuilder: (_, i) => Text('Page $i'),
              );
            },
          ),
        ),
      ),
    );

    expect(find.text('Page 0'), findsOneWidget);

    // Scroll the hidden page view (which is on top of the builder output in Stack order?)
    // Stack order:
    // 1. Positioned.fill(PageView) (hidden)
    // 2. widget.builder output
    // So widget.builder output is ON TOP.
    // Wait, if widget.builder output is on top, it receives touches.
    // If widget.builder uses `follower`, `follower` is driven by `controller`.
    // But `controller` is attached to the hidden PageView.
    // If the hidden PageView is BEHIND, how does it receive touches?
    // It doesn't, unless the top layer is transparent to touches.
    // But PageView usually consumes touches.
    // The doc says: "Internally it creates a stack with an invisible PageView on the bottom to handle scrolling".
    // If it's on the bottom, it's behind.
    // If the top layer (builder) has content, it might block touches.
    // Unless the top layer is `IgnorePointer` or passes touches through.
    // But the builder returns a PageView usually.
    // If the builder returns a PageView with `follower`, `follower` is controlled programmatically.
    // So the user is supposed to scroll the *hidden* PageView?
    // But it's behind!
    // Maybe `Positioned.fill` makes it cover everything?
    // Stack paints children in order. First child is bottom. Last child is top.
    // So `widget.builder` is top.
    // If `widget.builder` returns a PageView, that PageView will consume drags.
    // But `follower` is attached to it.
    // If `follower` is driven by `controller`, then `follower` shouldn't be scrolled by user?
    // Usually `NeverScrollableScrollPhysics` is used for follower.
    // If the user scrolls the top PageView, `follower` updates. But `follower` is supposed to *follow*.
    // The design seems to imply the user scrolls the *bottom* PageView.
    // But the bottom PageView is occluded by the top one.
    // Unless the top one is `IgnorePointer`?
    // Or maybe the top one is just visual elements that don't fill the space?
    // Or maybe I am misunderstanding the Stack order or touch hit testing.
    // If the top widget is transparent to hits (e.g. `IgnorePointer`), then hits go to bottom.
    // But the builder is expected to return "content".

    // Let's assume the user knows what they are doing (e.g. wrapping content in IgnorePointer).
    // Or maybe the `PageView` in `builder` should be `HitTestBehavior.translucent`?

    // For the test, we can try to scroll the `controller` programmatically and see if `follower` updates.

    capturedController!.jumpToPage(1);
    await tester.pumpAndSettle();

    expect(capturedFollower!.page, 1);
    expect(find.text('Page 1'), findsOneWidget);
  });
}
