import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/core/models/dialog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/dialog/base.dart';

void main() {
  // ignore: unused_local_variable
  TargetPlatform? debugDefaultTargetPlatformOverride;

  testWidgets('BaseDialog renders AndroidDialog on Android', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;

    final data = DialogEssentials(
      title: 'Title',
      message: 'Message',
      leftOption: 'Cancel',
      leftClicked: () {},
      rightOption: '',
      rightClicked: () {},
    );

    await tester.pumpWidget(MaterialApp(home: BaseDialog(data: data)));

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Message'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('BaseDialog renders IosDialog on iOS', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

    final data = DialogEssentials(
      title: 'Title',
      message: 'Message',
      leftOption: 'Cancel',
      leftClicked: () {},
      rightOption: '',
      rightClicked: () {},
    );

    await tester.pumpWidget(MaterialApp(home: BaseDialog(data: data)));

    expect(find.byType(CupertinoAlertDialog), findsOneWidget);
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Message'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    debugDefaultTargetPlatformOverride = null;
  });
}
