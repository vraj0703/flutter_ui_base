import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/pop_router_on_over_scroll.dart';

void main() {
  testWidgets('PopRouterOnOverScroll pops on overscroll', (
    WidgetTester tester,
  ) async {
    bool popped = false;
    final controller = ScrollController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => PopRouterOnOverScroll(
              controller: controller,
              child: ListView(
                controller: controller,
                physics: const BouncingScrollPhysics(), // Needed for overscroll
                children: const [
                  SizedBox(height: 1000, child: Text('Content')),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Mock context.pop() by checking if we can intercept it?
    // The widget calls context.pop(). In a test environment without a real router,
    // Navigator.pop might be called.
    // But context.pop() is an extension. If it uses Navigator.maybePop or similar.
    // Let's wrap in a Navigator and push a route so we can verify pop.

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (_) => PopRouterOnOverScroll(
                          controller: controller,
                          child: ListView(
                            controller: controller,
                            physics: const BouncingScrollPhysics(),
                            children: const [
                              SizedBox(height: 1000, child: Text('Content')),
                            ],
                          ),
                        ),
                      ),
                    )
                    .then((_) => popped = true);
              },
              child: const Text('Push'),
            ),
          ),
        ),
      ),
    );

    // Push route
    await tester.tap(find.text('Push'));
    await tester.pumpAndSettle();

    // Drag down to overscroll
    await tester.drag(find.text('Content'), const Offset(0, 100));
    await tester.pump(); // Scroll update

    // Should have popped
    await tester.pumpAndSettle();
    expect(popped, isTrue);
  });
}
