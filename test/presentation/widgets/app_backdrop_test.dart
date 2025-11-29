import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/app_backdrop.dart';
import 'package:flutter_ui_base/flutter_ui_base.dart';
import 'package:my_localizations/l10n/app_localizations.dart';
import 'package:my_theme_style/styles/styles.dart';
import 'package:my_theme_style/styles/colors.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final style = FakeAppStyle();
    // Use a dummy locale or try to load.
    final localizations = await AppLocalizations.delegate.load(
      const Locale('en'),
    );
    await FlutterUiBase.initialize(style: style, localizations: localizations);
  });

  testWidgets('AppBackdrop renders correctly without blur', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: AppBackdrop(strength: 0.5))),
    );

    final containerFinder = find.byType(Container);
    // We expect at least one container (the fill)
    expect(containerFinder, findsWidgets);
  });

  testWidgets('AppBackdrop renders correctly with blur', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AppBackdrop(strength: 0.5, blur: true)),
      ),
    );

    expect(find.byType(BackdropFilter), findsOneWidget);
  });

  testWidgets('AppBackdrop renders child', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AppBackdrop(child: Text('Hello'))),
      ),
    );

    expect(find.text('Hello'), findsOneWidget);
  });
}

class FakeAppStyle extends AppStyle {
  @override
  AppColors get colors => AppColors.fromJson(<String, dynamic>{
    'black': 0xFF000000,
    'white': 0xFFFFFFFF,
    'primary': 0xFF0000FF,
    'secondary': 0xFF00FF00,
  });
}
