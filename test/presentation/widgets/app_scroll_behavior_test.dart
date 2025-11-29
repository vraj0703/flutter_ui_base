import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/app_scroll_behavior.dart';

void main() {
  testWidgets('AppScrollBehavior uses BouncingScrollPhysics', (
    WidgetTester tester,
  ) async {
    final behavior = AppScrollBehavior();
    final physics = behavior.getScrollPhysics(
      tester.element(find.byType(Container)),
    ); // Context not really used by BouncingScrollPhysics
    expect(physics, isA<BouncingScrollPhysics>());
  });

  testWidgets('AppScrollBehavior adds mouse drag device', (
    WidgetTester tester,
  ) async {
    final behavior = AppScrollBehavior();
    expect(behavior.dragDevices, contains(PointerDeviceKind.mouse));
  });

  testWidgets('AppScrollBehavior builds RawScrollbar on desktop', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.windows;

    await tester.pumpWidget(
      MaterialApp(
        scrollBehavior: AppScrollBehavior(),
        home: Scaffold(
          body: ListView(
            children: List.generate(100, (index) => Text('Item $index')),
          ),
        ),
      ),
    );

    // It's hard to verify ScrollConfiguration wraps with RawScrollbar directly without inspecting the tree deep down.
    // But we can check if RawScrollbar is present in the tree.
    // Note: ScrollBehavior.buildScrollbar wraps the child.
    // So if we have a Scrollable, the scrollbar should be there.
    // However, ScrollBehavior is applied by ScrollConfiguration which wraps the Scrollable's viewport usually?
    // Actually, ScrollBehavior.buildScrollbar is called by Scrollable.

    expect(find.byType(RawScrollbar), findsOneWidget);

    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('AppScrollBehavior does NOT build RawScrollbar on mobile', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;

    await tester.pumpWidget(
      MaterialApp(
        scrollBehavior: AppScrollBehavior(),
        home: Scaffold(
          body: ListView(
            children: List.generate(100, (index) => Text('Item $index')),
          ),
        ),
      ),
    );

    expect(find.byType(RawScrollbar), findsNothing);

    debugDefaultTargetPlatformOverride = null;
  });
}
