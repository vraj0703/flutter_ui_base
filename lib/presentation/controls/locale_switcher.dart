import 'package:flutter_ui_base/common_libs.dart';

class LocaleSwitcher extends StatelessWidget {
  const LocaleSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    //final locale = watchX((SettingsLogic s) => s.currentLocale);
    Future<void> handleSwapLocale() async {
      //final newLocale = Locale(locale == 'en' ? 'zh' : 'en');
      //await settingsLogic.changeLocale(newLocale);
    }

    return AppButton.from(
        text: $strings.appName,
        onPressed: handleSwapLocale,
        padding: EdgeInsets.all($insets.sm));
  }
}
