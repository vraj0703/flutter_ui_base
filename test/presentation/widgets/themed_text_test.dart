import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/flutter_ui_base.dart';
import 'package:flutter_ui_base/presentation/widgets/themed_text.dart';
import 'package:my_localizations/l10n/app_localizations.dart';
import 'package:my_theme_style/styles/styles.dart';
import 'package:my_theme_style/styles/colors.dart'; // Ensure AppColors is imported if not exported by styles.dart

void main() {
  testWidgets('ThemedText applies colors', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Initialize with FakeAppStyle
    final style = FakeAppStyle();
    // We don't need real localizations for this test, but we need to pass something.
    // We can pass null if we trust it won't be used, or a dummy.
    // But initialize requires non-null.
    // Let's try to load localizations again, or mock it if it was failing too.
    // The previous error was about AppColors, so localizations might be fine.
    final localizations = await AppLocalizations.delegate.load(
      const Locale('en'),
    );

    await FlutterUiBase.initialize(style: style, localizations: localizations);

    await tester.pumpWidget(
      const MaterialApp(
        home: Column(
          children: [
            LightText(child: Text('Light')),
            DarkText(child: Text('Dark')),
            DefaultTextColor(color: Colors.red, child: Text('Red')),
          ],
        ),
      ),
    );

    final lightContext = tester.element(find.text('Light'));
    final lightStyle = DefaultTextStyle.of(lightContext).style;
    expect(lightStyle.color, Colors.white);

    final darkContext = tester.element(find.text('Dark'));
    final darkStyle = DefaultTextStyle.of(darkContext).style;
    expect(darkStyle.color, Colors.black);

    final redContext = tester.element(find.text('Red'));
    final redStyle = DefaultTextStyle.of(redContext).style;
    expect(redStyle.color, Colors.red);
  });
}

class FakeAppStyle extends AppStyle {
  @override
  AppColors get colors => AppColors.fromJson({
    'black': 0xFF000000,
    'white': 0xFFFFFFFF,
    'primary': 0xFF0000FF, // Guessing some common keys
    'secondary': 0xFF00FF00,
  });
}
