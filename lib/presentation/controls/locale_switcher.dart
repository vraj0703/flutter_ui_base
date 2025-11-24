import 'package:flutter_ui_base/common_libs.dart';

class LocaleSwitcher extends StatelessWidget {
  LocaleSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    //final locale = watchX((SettingsLogic s) => s.currentLocale);
    Future<void> handleSwapLocale() async {
      //final newLocale = Locale(locale == 'en' ? 'zh' : 'en');
      //await settingsLogic.changeLocale(newLocale);
    }

    return AppBtn.from(
        text: $strings.appName,
        onPressed: handleSwapLocale,
        padding: EdgeInsets.all($styles.insets.sm));
  }
}
